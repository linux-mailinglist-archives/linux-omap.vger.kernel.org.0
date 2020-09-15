Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA0F2269F6C
	for <lists+linux-omap@lfdr.de>; Tue, 15 Sep 2020 09:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgIOHNp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Sep 2020 03:13:45 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:1314 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726119AbgIOHNn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:43 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08F7CT9r008378;
        Tue, 15 Sep 2020 09:13:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=QvCfA91FVwCDbBDN11Y5LvhX6jukmlC0QOPchjpIoQI=;
 b=z92xUoCl2NvhVhBK1TspT0coUXVOLwvUbth2hIzfb9c2+/QlXiNXnz2Pe0wWxoxrMsXM
 Ll+yHE/ZtBDStNU1g1ZhoMFN5CrN8safCh0dJ2jL2wA7a0FrIHOghA3AQkFbb5UIpQyw
 HxsnJQSAO376ua53v3z38S7pg3ocfA2mhI8rIT3vNL0IbvaVtl58lp72CaoBy5TxldaQ
 iU3+158QpE07A7l9XFXsIyLGrkRvVu0UbhOkxwVgaQtr0Zgu5AZR3TqjNEW9GXfbjh7l
 sY6Ugq2fhtN7zrpEFHmqnnRFF0DQ5owD+td4V/dMMXv9NtP4RCBQJGHtC0skwJkvql3e 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33gkf9ecab-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 15 Sep 2020 09:13:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4ABB1100034;
        Tue, 15 Sep 2020 09:13:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 348DA21CA68;
        Tue, 15 Sep 2020 09:13:28 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.51) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Sep
 2020 09:13:15 +0200
Subject: Re: [balbi-usb:testing/next 32/38] drivers/usb/dwc2/drd.c:71:
 undefined reference to `usb_role_switch_get_drvdata'
To:     kernel test robot <lkp@intel.com>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>
References: <202009151336.53lUhHje%lkp@intel.com>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <bff256bc-0de2-923e-92a7-a8cd5e682f30@st.com>
Date:   Tue, 15 Sep 2020 09:13:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009151336.53lUhHje%lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-15_04:2020-09-15,2020-09-15 signatures=0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 9/15/20 7:16 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
> head:   3c9722514c3fb74bbe0af87c20bc6b4c47121287
> commit: a0f0bc95705446b8b1476338056bf869271ba36a [32/38] usb: dwc2: override PHY input signals with usb role switch support
> config: i386-randconfig-a014-20200914 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=1 build):
>          git checkout a0f0bc95705446b8b1476338056bf869271ba36a
>          # save the attached .config to linux build tree
>          make W=1 ARCH=i386
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     ld: drivers/usb/dwc2/drd.o: in function `dwc2_drd_role_sw_set':
>>> drivers/usb/dwc2/drd.c:71: undefined reference to `usb_role_switch_get_drvdata'
>     ld: drivers/usb/dwc2/drd.o: in function `dwc2_drd_init':
>>> drivers/usb/dwc2/drd.c:134: undefined reference to `usb_role_switch_register'
>     ld: drivers/usb/dwc2/drd.o: in function `dwc2_drd_exit':
>>> drivers/usb/dwc2/drd.c:179: undefined reference to `usb_role_switch_unregister'
> 
> # https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?id=a0f0bc95705446b8b1476338056bf869271ba36a
> git remote add balbi-usb https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
> git fetch --no-tags balbi-usb testing/next
> git checkout a0f0bc95705446b8b1476338056bf869271ba36a
> vim +71 drivers/usb/dwc2/drd.c
> 
>      68	
>      69	static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
>      70	{
>    > 71		struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
>      72		unsigned long flags;
>      73		int already = 0;
>      74	
>      75		/* Skip session not in line with dr_mode */
>      76		if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
>      77		    (role == USB_ROLE_HOST && hsotg->dr_mode == USB_DR_MODE_PERIPHERAL))
>      78			return -EINVAL;
>      79	
>      80	#if IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) || \
>      81		IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)
>      82		/* Skip session if core is in test mode */
>      83		if (role == USB_ROLE_NONE && hsotg->test_mode) {
>      84			dev_dbg(hsotg->dev, "Core is in test mode\n");
>      85			return -EBUSY;
>      86		}
>      87	#endif
>      88	
>      89		spin_lock_irqsave(&hsotg->lock, flags);
>      90	
>      91		if (role == USB_ROLE_HOST) {
>      92			already = dwc2_ovr_avalid(hsotg, true);
>      93		} else if (role == USB_ROLE_DEVICE) {
>      94			already = dwc2_ovr_bvalid(hsotg, true);
>      95			/* This clear DCTL.SFTDISCON bit */
>      96			dwc2_hsotg_core_connect(hsotg);
>      97		} else {
>      98			if (dwc2_is_device_mode(hsotg)) {
>      99				if (!dwc2_ovr_bvalid(hsotg, false))
>     100					/* This set DCTL.SFTDISCON bit */
>     101					dwc2_hsotg_core_disconnect(hsotg);
>     102			} else {
>     103				dwc2_ovr_avalid(hsotg, false);
>     104			}
>     105		}
>     106	
>     107		spin_unlock_irqrestore(&hsotg->lock, flags);
>     108	
>     109		if (!already && hsotg->dr_mode == USB_DR_MODE_OTG)
>     110			/* This will raise a Connector ID Status Change Interrupt */
>     111			dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
>     112	
>     113		dev_dbg(hsotg->dev, "%s-session valid\n",
>     114			role == USB_ROLE_NONE ? "No" :
>     115			role == USB_ROLE_HOST ? "A" : "B");
>     116	
>     117		return 0;
>     118	}
>     119	
>     120	int dwc2_drd_init(struct dwc2_hsotg *hsotg)
>     121	{
>     122		struct usb_role_switch_desc role_sw_desc = {0};
>     123		struct usb_role_switch *role_sw;
>     124		int ret;
>     125	
>     126		if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
>     127			return 0;
>     128	
>     129		role_sw_desc.driver_data = hsotg;
>     130		role_sw_desc.fwnode = dev_fwnode(hsotg->dev);
>     131		role_sw_desc.set = dwc2_drd_role_sw_set;
>     132		role_sw_desc.allow_userspace_control = true;
>     133	
>   > 134		role_sw = usb_role_switch_register(hsotg->dev, &role_sw_desc);
>     135		if (IS_ERR(role_sw)) {
>     136			ret = PTR_ERR(role_sw);
>     137			dev_err(hsotg->dev,
>     138				"failed to register role switch: %d\n", ret);
>     139			return ret;
>     140		}
>     141	
>     142		hsotg->role_sw = role_sw;
>     143	
>     144		/* Enable override and initialize values */
>     145		dwc2_ovr_init(hsotg);
>     146	
>     147		return 0;
>     148	}
>     149	
>     150	void dwc2_drd_suspend(struct dwc2_hsotg *hsotg)
>     151	{
>     152		u32 gintsts, gintmsk;
>     153	
>     154		if (hsotg->role_sw && !hsotg->params.external_id_pin_ctl) {
>     155			gintmsk = dwc2_readl(hsotg, GINTMSK);
>     156			gintmsk &= ~GINTSTS_CONIDSTSCHNG;
>     157			dwc2_writel(hsotg, gintmsk, GINTMSK);
>     158			gintsts = dwc2_readl(hsotg, GINTSTS);
>     159			dwc2_writel(hsotg, gintsts | GINTSTS_CONIDSTSCHNG, GINTSTS);
>     160		}
>     161	}
>     162	
>     163	void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
>     164	{
>     165		u32 gintsts, gintmsk;
>     166	
>     167		if (hsotg->role_sw && !hsotg->params.external_id_pin_ctl) {
>     168			gintsts = dwc2_readl(hsotg, GINTSTS);
>     169			dwc2_writel(hsotg, gintsts | GINTSTS_CONIDSTSCHNG, GINTSTS);
>     170			gintmsk = dwc2_readl(hsotg, GINTMSK);
>     171			gintmsk |= GINTSTS_CONIDSTSCHNG;
>     172			dwc2_writel(hsotg, gintmsk, GINTMSK);
>     173		}
>     174	}
>     175	
>     176	void dwc2_drd_exit(struct dwc2_hsotg *hsotg)
>     177	{
>     178		if (hsotg->role_sw)
>   > 179			usb_role_switch_unregister(hsotg->role_sw);
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

Fixed in v6 patchset: 
https://lore.kernel.org/patchwork/project/lkml/list/?series=461852.

Regards,
Amelie
