Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC9EEA42
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2019 20:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbfD2SkJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Apr 2019 14:40:09 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:37944 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbfD2SkJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Apr 2019 14:40:09 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3TITABQ152714;
        Mon, 29 Apr 2019 18:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=j0AJlgOFT0aoHqUBDmivQXLsxYBIT5dXF99E3snJngs=;
 b=U/mRA5vtoapEKoFo4Uxi4fS5VJhFz3BKfSXG9rZM0IMTtSb2t2nwPJPZMUyN1gmS9oXC
 FvOteREIPlFtXx5lZt5yDWwp/g/erIoDr76RetP0Ll+dTEVpEv2LMORWZEIVTlZArq3i
 n3Xe5ySN1KXAUTWILRzQzcesLvTWHhxJhuTslJ5m8BB8P0q2YjPPr8lWUHe34m0dSYKl
 chBX/bj39eaZnPQQ8LgidUYtrmXhDxvQbl4IH8in0geUNvDLj09ahGtARDNQF2sEmgbV
 YtHVq4x+xmBXeH3Zb3+hypNVO1v9Sh0Xd2BaCTfROP/qU/vmCoWYkVlJ6Ev0WudfOQOZ /A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 2s4fqq05dp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 29 Apr 2019 18:40:03 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3TIcxOe087523;
        Mon, 29 Apr 2019 18:40:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2s5u50jd03-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 29 Apr 2019 18:40:02 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3TIe0bQ027494;
        Mon, 29 Apr 2019 18:40:01 GMT
Received: from Santoshs-MacBook-Pro.local (/10.11.38.116)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 29 Apr 2019 11:40:00 -0700
Subject: Re: [PATCH] soc: ti: pm33xx: Add a print while entering RTC only mode
 with DDR in self-refresh
To:     Keerthy <j-keerthy@ti.com>, ssantosh@kernel.org, tony@atomide.com
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        d-gerlach@ti.com, t-kristo@ti.com
References: <20190429044435.19315-1-j-keerthy@ti.com>
From:   "santosh.shilimkar@oracle.com" <santosh.shilimkar@oracle.com>
Organization: Oracle Corporation
Message-ID: <b862e2c4-781c-ced9-3a6f-b0095562732a@oracle.com>
Date:   Mon, 29 Apr 2019 11:39:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429044435.19315-1-j-keerthy@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=998
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904290126
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9242 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904290126
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 4/28/19 9:44 PM, Keerthy wrote:
> Currently there is no way to distinguish if the SoC entered DS0
> mode or the RTC only mode. Hence add a print before entering
> the RTC only mode.
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>

Tony, Am assuming you will queue this up ?
