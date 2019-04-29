
void pringMenu(){
	cout << endl << endl;
	int line_length = 0;
	for(int i=0; i<FUNCTION_NUM; i++){
		cout << g_function_table[i].select_string << " " << g_function_table[i].menu_display << "; ";
		line_length = line_length + g_function_table[i].select_string.length() + g_function_table[i].menu_display.length();
		//print new line 
		if(line_length > 40){
			line_length = 0;
			cout << endl;
		}
	}	
} 

void waitForFunctionSelect(void){
	while(1){
		pringMenu();
		string input_string;
		cout <<"q to exit:";
		cin >> input_string;
		if(!input_string.compare("q")){
			exit(0);
		}
		else {
			int find = 0 ;
			for(int i=0; i<FUNCTION_NUM; i++){
				if(!input_string.compare( g_function_table[i].select_string)) {
					find = 1; 
						g_function_table[i].function_name();
					break; 
				}
			}
			if(!find){
				cout <<"************************* invalid input *************************" << endl;
			}
		} 
	}	
}
