Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFFA0156FE9
	for <lists+linux-omap@lfdr.de>; Mon, 10 Feb 2020 08:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgBJHb3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 10 Feb 2020 02:31:29 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:56300 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726061AbgBJHb2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 10 Feb 2020 02:31:28 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01A7OElx065123;
        Mon, 10 Feb 2020 07:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=s6AinvzoHu/EdvI5/km7p3NZcYYsNfxd02N+9fjiWIA=;
 b=o+d91p+OipC5huZT6Phm67TlEy2DB6c4trFdSjRGyGzSpbl5jDGUgfPpyYJSutDJFeYM
 1IhStyHLn321q25Vh4NEwGI0duBASeEttF6U2HaMXax+I6JzqyIAavHqhCRiSsYHxOfa
 44Hb1kU/FnkN8Hp/7b+rsvGpACvyDFgo9rCzwI1u21QummBTD4iz929aU4t7E8U06MA5
 4syRIURPuET08VR6YI6BMR40e3Nr1xKHRpuTlfnOgcIrCahchwFNzw5FnsPZN+Bj3ruz
 4TQlzWRlfjn7t0Vb6YxfdKsDHIbkp9QlvEUG+z5cq66j3EvGDKfG67C3ZzTn+XpSp7mI QQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2y2k87t5ge-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 Feb 2020 07:31:21 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01A7MN3i168306;
        Mon, 10 Feb 2020 07:31:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3020.oracle.com with ESMTP id 2y26sgh3sg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 10 Feb 2020 07:31:20 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01A7VICF013006;
        Mon, 10 Feb 2020 07:31:18 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Sun, 09 Feb 2020 23:31:18 -0800
Date:   Mon, 10 Feb 2020 10:31:10 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Yue Wang <yue.wang@amlogic.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [balbi-usb:testing/next 5/10] drivers/usb/dwc3/dwc3-meson-g12a.c:455
 dwc3_meson_g12a_otg_init() error: uninitialized symbol 'ret'.
Message-ID: <20200210073110.GQ24804@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9526 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002100062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9526 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 impostorscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002100062
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testing/next
head:   b081f1dc121c0bdeacc45cf02c35d1ee95120680
commit: 729149c53f048f16aff9e662bf444c275b59ba8a [5/10] usb: dwc3: Add Amlogic A1 DWC3 glue

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/dwc3/dwc3-meson-g12a.c:455 dwc3_meson_g12a_otg_init() error: uninitialized symbol 'ret'.

# https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/commit/?id=729149c53f048f16aff9e662bf444c275b59ba8a
git remote add balbi-usb https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
git remote update balbi-usb
git checkout 729149c53f048f16aff9e662bf444c275b59ba8a
vim +/ret +455 drivers/usb/dwc3/dwc3-meson-g12a.c

729149c53f048f Hanjie Lin     2020-01-20  411  static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
729149c53f048f Hanjie Lin     2020-01-20  412  				    struct dwc3_meson_g12a *priv)
729149c53f048f Hanjie Lin     2020-01-20  413  {
729149c53f048f Hanjie Lin     2020-01-20  414  	enum phy_mode otg_id;
729149c53f048f Hanjie Lin     2020-01-20  415  	int ret, irq;
729149c53f048f Hanjie Lin     2020-01-20  416  	struct device *dev = &pdev->dev;
729149c53f048f Hanjie Lin     2020-01-20  417  
729149c53f048f Hanjie Lin     2020-01-20  418  	if (!priv->drvdata->otg_switch_supported)
729149c53f048f Hanjie Lin     2020-01-20  419  		return 0;
729149c53f048f Hanjie Lin     2020-01-20  420  
729149c53f048f Hanjie Lin     2020-01-20  421  	if (priv->otg_mode == USB_DR_MODE_OTG) {
729149c53f048f Hanjie Lin     2020-01-20  422  		/* Ack irq before registering */
729149c53f048f Hanjie Lin     2020-01-20  423  		regmap_update_bits(priv->regmap, USB_R5,
729149c53f048f Hanjie Lin     2020-01-20  424  				   USB_R5_ID_DIG_IRQ, 0);
729149c53f048f Hanjie Lin     2020-01-20  425  
729149c53f048f Hanjie Lin     2020-01-20  426  		irq = platform_get_irq(pdev, 0);
729149c53f048f Hanjie Lin     2020-01-20  427  		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
729149c53f048f Hanjie Lin     2020-01-20  428  						dwc3_meson_g12a_irq_thread,
729149c53f048f Hanjie Lin     2020-01-20  429  						IRQF_ONESHOT, pdev->name, priv);
729149c53f048f Hanjie Lin     2020-01-20  430  		if (ret)
729149c53f048f Hanjie Lin     2020-01-20  431  			return ret;
729149c53f048f Hanjie Lin     2020-01-20  432  	}
729149c53f048f Hanjie Lin     2020-01-20  433  
729149c53f048f Hanjie Lin     2020-01-20  434  	/* Setup OTG mode corresponding to the ID pin */
729149c53f048f Hanjie Lin     2020-01-20  435  	if (priv->otg_mode == USB_DR_MODE_OTG) {
729149c53f048f Hanjie Lin     2020-01-20  436  		otg_id = dwc3_meson_g12a_get_id(priv);
729149c53f048f Hanjie Lin     2020-01-20  437  		if (otg_id != priv->otg_phy_mode) {
729149c53f048f Hanjie Lin     2020-01-20  438  			if (dwc3_meson_g12a_otg_mode_set(priv, otg_id))
729149c53f048f Hanjie Lin     2020-01-20  439  				dev_warn(dev, "Failed to switch OTG mode\n");
729149c53f048f Hanjie Lin     2020-01-20  440  		}
729149c53f048f Hanjie Lin     2020-01-20  441  	}
729149c53f048f Hanjie Lin     2020-01-20  442  
729149c53f048f Hanjie Lin     2020-01-20  443  	/* Setup role switcher */
729149c53f048f Hanjie Lin     2020-01-20  444  	priv->switch_desc.usb2_port = dwc3_meson_g12_find_child(dev,
729149c53f048f Hanjie Lin     2020-01-20  445  								"snps,dwc3");
729149c53f048f Hanjie Lin     2020-01-20  446  	priv->switch_desc.udc = dwc3_meson_g12_find_child(dev, "snps,dwc2");
729149c53f048f Hanjie Lin     2020-01-20  447  	priv->switch_desc.allow_userspace_control = true;
729149c53f048f Hanjie Lin     2020-01-20  448  	priv->switch_desc.set = dwc3_meson_g12a_role_set;
729149c53f048f Hanjie Lin     2020-01-20  449  	priv->switch_desc.get = dwc3_meson_g12a_role_get;
729149c53f048f Hanjie Lin     2020-01-20  450  
729149c53f048f Hanjie Lin     2020-01-20  451  	priv->role_switch = usb_role_switch_register(dev, &priv->switch_desc);
729149c53f048f Hanjie Lin     2020-01-20  452  	if (IS_ERR(priv->role_switch))
729149c53f048f Hanjie Lin     2020-01-20  453  		dev_warn(dev, "Unable to register Role Switch\n");
729149c53f048f Hanjie Lin     2020-01-20  454  
729149c53f048f Hanjie Lin     2020-01-20 @455  	return ret;

"ret" can be uninitialized.  It should be "return 0;" anyway.

729149c53f048f Hanjie Lin     2020-01-20  456  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
