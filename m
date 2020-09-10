Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99FD5263ED2
	for <lists+linux-omap@lfdr.de>; Thu, 10 Sep 2020 09:34:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgIJHew (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 03:34:52 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:1175 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728297AbgIJHev (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Sep 2020 03:34:51 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08A7Qsvo001037;
        Thu, 10 Sep 2020 09:34:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=yitzxd1EpxSR+UWF5RZLvTzZh1+/ExLz6X9wKwEHp6c=;
 b=nZkhw9kUN+I2HILMVN6KMn/4f3IhIl+hTkgVaz7LymhFmX6Yaen1vqRfif7nItEFDy0W
 VzOOoOZhJxnaXG0QZn+FNFmXUdFRxa4wvcmjIWZXbBhNszmj2zDOn3vjmT+Tks45w+SA
 6Ql6tRmp+hu6oMRjjs42MJKjXLmIcI4UbvMCOrn5JcDAXplgcLUGRJE8segauxo6djdQ
 yBeId3gNdpjsYiIZfeW8P5YXSwAoFkoP6miPjXAyy+QP2MG8fvZt/mQpCRltySB4Pooq
 l8txBZZcwQ2oNiqaJE8ysdEWVemf5LRMGlCBKHK2oAnuoN11aQgwK8rUwfz24HgYdpjf Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 33c051hm4p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Sep 2020 09:34:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EBD7F10002A;
        Thu, 10 Sep 2020 09:34:36 +0200 (CEST)
Received: from Webmail-eu.st.com (gpxdag3node5.st.com [10.75.127.72])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D0F57212104;
        Thu, 10 Sep 2020 09:34:36 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.46) by GPXDAG3NODE5.st.com
 (10.75.127.72) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 09:34:35 +0200
Subject: Re: [balbi-usb:testing/next 32/38] ld.lld: error: undefined symbol:
 usb_role_switch_get_drvdata
To:     kernel test robot <lkp@intel.com>, Felipe Balbi <balbi@kernel.org>
CC:     "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <202009100918.i31tdoK9%lkp@intel.com>
From:   Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <497fbf82-805b-5b82-28f0-114c3f31756f@st.com>
Date:   Thu, 10 Sep 2020 09:34:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009100918.i31tdoK9%lkp@intel.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To GPXDAG3NODE5.st.com
 (10.75.127.72)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-10_01:2020-09-10,2020-09-10 signatures=0
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 9/10/20 3:29 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
> head:   3c9722514c3fb74bbe0af87c20bc6b4c47121287
> commit: a0f0bc95705446b8b1476338056bf869271ba36a [32/38] usb: dwc2: override PHY input signals with usb role switch support
> config: x86_64-randconfig-r022-20200909 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 8893d0816ccdf8998d2e21b5430e9d6abe7ef465)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          git checkout a0f0bc95705446b8b1476338056bf869271ba36a
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: usb_role_switch_get_drvdata
>     >>> referenced by drd.c:71 (drivers/usb/dwc2/drd.c:71)
>     >>> usb/dwc2/drd.o:(dwc2_drd_role_sw_set) in archive drivers/built-in.a
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

fixed in v6 version: 
https://lore.kernel.org/patchwork/project/lkml/list/?series=461852
