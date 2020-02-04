Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCB3151AA0
	for <lists+linux-omap@lfdr.de>; Tue,  4 Feb 2020 13:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbgBDMjT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Feb 2020 07:39:19 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:53284 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgBDMjT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Feb 2020 07:39:19 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014CXAo5070369;
        Tue, 4 Feb 2020 12:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=/RNRaemTG1S+xgpa61Fs7I2XmnjFMf9zaCV1SIWk56Q=;
 b=YQsa2f9CNUKYT1EHAaWFi0b+kyf7NzZiOJYs21XDdYQjXhFduLs1qfIE1f8lSa6ivQAa
 yAH+w9Kf6t4B5x5mJA0LUf9qHUmnEA+sylENrz3OGqY6nFEzEw19TME5g1bo3WxnzTWX
 B8mypKgiTYq6Yi6megd3LCJxhmO/SgL+ds4iKoU19XA1iHyjIEZotoy+2QOedvs0isAp
 A+244VXITwE2DLjO//q0CKChY1XKnIHxr0y+8dTrRsZ3QQBqKJPGm5n1yWSxAcA8U825
 jDt3ZF8+U4qFvGNVRoobbDmYkDNB5XycLXjbAVx5m32ZO530PTQ2Ix47mw7mNiStzqhj aw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by aserp2120.oracle.com with ESMTP id 2xw19qec9x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 12:39:16 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014CXZsI058986;
        Tue, 4 Feb 2020 12:39:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by aserp3030.oracle.com with ESMTP id 2xxw0wveu7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 12:39:16 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 014CdFQQ022123;
        Tue, 4 Feb 2020 12:39:15 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 04 Feb 2020 04:39:15 -0800
Date:   Tue, 4 Feb 2020 15:39:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     tomi.valkeinen@ti.com
Cc:     linux-omap@vger.kernel.org
Subject: [bug report] omapfb: copy omapdss & displays for omapfb
Message-ID: <20200204123909.3gyarjvlyz6yl4d6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=520
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040089
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=576 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040089
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Tomi Valkeinen,

The patch f76ee892a99e: "omapfb: copy omapdss & displays for omapfb"
from Dec 9, 2015, leads to the following static checker warning:

	drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c:336 display_uninit_sysfs()
	warn: passing freed memory 'dssdev'

drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
   332  void display_uninit_sysfs(struct platform_device *pdev)
   333  {
   334          struct omap_dss_device *dssdev = NULL;
   335  
   336          for_each_dss_dev(dssdev) {
   337                  if (kobject_name(&dssdev->kobj) == NULL)
   338                          continue;
   339  
   340                  kobject_del(&dssdev->kobj);
   341                  kobject_put(&dssdev->kobj);
   342  
   343                  memset(&dssdev->kobj, 0, sizeof(dssdev->kobj));

Depending on the config options kobject_release() might delay clean up
for 1-4 seconds so this memset() could lead to bugs.

   344          }
   345  }

regards,
dan carpenter
