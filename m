Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DCA262C1C
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 11:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgIIJj4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 05:39:56 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:23848 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726036AbgIIJj4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 9 Sep 2020 05:39:56 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0899XgQH010720;
        Wed, 9 Sep 2020 11:39:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=PykR6OaCTds9EU5d37YAScx//FGQpVST4bf8i4TIE4E=;
 b=vYN6dzPAZDYNgez96cms6Df2eYcajYaTqs6DSx5XJCkXFxOVhvWTMJdIOgRPkSd91EPO
 Szrda4zRdRpjlo3EsMQLQXPUDHWbBzP3WosXiXDy2u+GSJGJdUT+rMDl2WxARKYlHQ0v
 wN8EK9jv33C00NitDYNWZgj4+79ebnghlOZF6cq1wDdbL23iU10Ljn1CS11IVa/iOYaS
 wiruGsBqdDEK1WFdG99sxG2NFl5WH+4u2MQ5JFMbAzrOEULtfj790l4s9UjCzLqluHJu
 zRbJM8mVWmlWqo2UD+u8vCoLsgcCO0yrQStMqA+0dtWdjMSh6eNEfe3+/fdIeU4joQ7J Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33byt7vt75-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Sep 2020 11:39:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7866D10002A;
        Wed,  9 Sep 2020 11:39:31 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62AE0220AEC;
        Wed,  9 Sep 2020 11:39:31 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.49) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Sep
 2020 11:39:30 +0200
Subject: Re: [balbi-usb:testing/next 32/38] drd.c:undefined reference to
 `usb_role_switch_get_drvdata'
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
To:     Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <202009090044.0oZdDUmk%lkp@intel.com> <87eenbld3z.fsf@kernel.org>
 <91a69ea7-71b8-be3c-19ad-980306681b2c@st.com>
 <55abf0b6-2b21-faf2-7581-9be7da4475f2@st.com>
Message-ID: <87721d13-1724-b3e3-aa65-35185be4bac1@st.com>
Date:   Wed, 9 Sep 2020 11:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <55abf0b6-2b21-faf2-7581-9be7da4475f2@st.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-09_03:2020-09-08,2020-09-09 signatures=0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 9/9/20 10:58 AM, Amelie DELAUNAY wrote:
> 
> 
> On 9/9/20 9:33 AM, Amelie DELAUNAY wrote:
>> Hi,
>>
>> On 9/9/20 7:42 AM, Felipe Balbi wrote:
>>>
>>> Hi,
>>>
>>> kernel test robot <lkp@intel.com> writes:
>>>> tree:   
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git 
>>>> testing/next
>>>> head:   3c9722514c3fb74bbe0af87c20bc6b4c47121287
>>>> commit: a0f0bc95705446b8b1476338056bf869271ba36a [32/38] usb: dwc2: 
>>>> override PHY input signals with usb role switch support
>>>> config: arc-randconfig-r016-20200908 (attached as .config)
>>>> compiler: arceb-elf-gcc (GCC) 9.3.0
>>>> reproduce (this is a W=1 build):
>>>>          wget 
>>>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
>>>> -O ~/bin/make.cross
>>>>          chmod +x ~/bin/make.cross
>>>>          git checkout a0f0bc95705446b8b1476338056bf869271ba36a
>>>>          # save the attached .config to linux build tree
>>>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 
>>>> make.cross ARCH=arc
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>     arceb-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
>>>>     stackdepot.c:(.text+0x5a): undefined reference to 
>>>> `__irqentry_text_start'
>>>>     arceb-elf-ld: stackdepot.c:(.text+0x5a): undefined reference to 
>>>> `__irqentry_text_start'
>>>>     arceb-elf-ld: stackdepot.c:(.text+0x62): undefined reference to 
>>>> `__irqentry_text_end'
>>>>     arceb-elf-ld: stackdepot.c:(.text+0x62): undefined reference to 
>>>> `__irqentry_text_end'
>>>>     arceb-elf-ld: stackdepot.c:(.text+0x6a): undefined reference to 
>>>> `__softirqentry_text_start'
>>>>     arceb-elf-ld: stackdepot.c:(.text+0x6a): undefined reference to 
>>>> `__softirqentry_text_start'
>>>>     arceb-elf-ld: stackdepot.c:(.text+0x72): undefined reference to 
>>>> `__softirqentry_text_end'
>>>>     arceb-elf-ld: stackdepot.c:(.text+0x72): undefined reference to 
>>>> `__softirqentry_text_end'
>>>>     arceb-elf-ld: drivers/usb/dwc2/drd.o: in function 
>>>> `dwc2_drd_role_sw_set':
>>>>>> drd.c:(.text+0x82): undefined reference to 
>>>>>> `usb_role_switch_get_drvdata'
>>>>>> arceb-elf-ld: drd.c:(.text+0x82): undefined reference to 
>>>>>> `usb_role_switch_get_drvdata'
>>>>     arceb-elf-ld: drivers/usb/dwc2/drd.o: in function `dwc2_drd_init':
>>>>>> drd.c:(.text+0x1c0): undefined reference to 
>>>>>> `usb_role_switch_register'
>>>>>> arceb-elf-ld: drd.c:(.text+0x1c0): undefined reference to 
>>>>>> `usb_role_switch_register'
>>>>     arceb-elf-ld: drivers/usb/dwc2/drd.o: in function `dwc2_drd_exit':
>>>>>> drd.c:(.text+0x2c4): undefined reference to 
>>>>>> `usb_role_switch_unregister'
>>>>>> arceb-elf-ld: drd.c:(.text+0x2c4): undefined reference to 
>>>>>> `usb_role_switch_unregister'
>>>
>>> Amelie? Have you seen this? Is it ARC-specific?
>>>
>> Never seen this before. But looking at DWC2 Kconfig and Makefile, I 
>> should have add the 'select USB_ROLE_SWITCH' as it is in DWC3 Kconfig. 
>> Because in my patch, USB_ROLE_SWITCH is selected if 
>> USB_DWC2_DUAL_ROLE, but drd.c (using USB role switch API) is compiled 
>> if CONFIG_USB_DWC2 is enabled, whatever DWC2 mode.
>>
>> So, an update of DWC2 Kconfig/Makefile as DWC3 seems required.
>> I send a v6 or a fixup of "usb: dwc2: override PHY input signals with 
>> usb role switch support" can be done ?
> 
> ARC DWC2/USB_ROLE_SWITCH config is:
> CONFIG_USB_DWC2=y
> CONFIG_USB_DWC2_DUAL_ROLE=n
> CONFIG_USB_DWC2_HOST=y
> CONFIG_USB_DWC2_PERIPHERAL=n
> CONFIG_USB_ROLE_SWITCH=m
> 
> I succeed to reproduce the issue with this configuration. I'm preparing 
> a fix.

New series sent: 
https://lore.kernel.org/patchwork/project/lkml/list/?series=461852
