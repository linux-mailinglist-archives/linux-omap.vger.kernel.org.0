Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEB78A3C97
	for <lists+linux-omap@lfdr.de>; Fri, 30 Aug 2019 18:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727945AbfH3QvC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 30 Aug 2019 12:51:02 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:34766 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3QvC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 30 Aug 2019 12:51:02 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7UGnFlb018778;
        Fri, 30 Aug 2019 16:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=4W6MfuEHcSxRT7yJ6X9e/Gz29oowuWAtaR9pBiOjmXg=;
 b=d8hQCtSVlz9uq1VUzH2ddO4k6scROOdpIfPxB+u4ltjbyMV95KYjKXK0uncwx0S55Bjd
 0d6kfYpDLLzM+JYHfe0919XfmiKx1z6VglHwdnqc4vx7vS4vyCVeAqcpWqwh7i6OtD2q
 VFUAkQbtYr+BTypU4e5xKna3pIp8OJBvbXayCxjZSdC0BS9JM6D7hIgWfw5nRZLr1Obp
 tEOT9GSxgyI8JnGv8MhIoHUOZvlh61j3KzpfiL7CakTxIZ/QyXq1cAgB2366chsDyCtD
 qGRHlsy6Kwe5ov0F6i3Awuzb4ek/nC0It9v8MXo8NTlKM/DVG/DFK2uFMB4Rn8AKqlNP BA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2uq7ngr063-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Aug 2019 16:50:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x7UGmTPm039008;
        Fri, 30 Aug 2019 16:50:46 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2upkrgke9s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Aug 2019 16:50:46 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x7UGogNa022354;
        Fri, 30 Aug 2019 16:50:43 GMT
Received: from [10.209.243.89] (/10.209.243.89)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 30 Aug 2019 09:50:41 -0700
Subject: Re: [PATCHv3 00/10] soc: ti: add OMAP PRM driver (for reset)
To:     Tero Kristo <t-kristo@ti.com>, ssantosh@kernel.org,
        linux-omap@vger.kernel.org, tony@atomide.com, s-anna@ti.com,
        p.zabel@pengutronix.de
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20190830121816.30034-1-t-kristo@ti.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <f7d6a2fb-175c-361b-00ff-ddde67700daa@oracle.com>
Date:   Fri, 30 Aug 2019 09:50:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190830121816.30034-1-t-kristo@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9365 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1908300164
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9365 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1908300164
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/30/19 5:18 AM, Tero Kristo wrote:
> Hi,
> 
> V3 of the series, ended up re-sending the whole series as I squashed one
> patch from v2 and because of that the ordering has changed a bit. Changes
> in v3 contain fixes for the comments from Philipp Zabel.
> 
> - added spinlock to protect register writes
> - added own xlate function to prevent bad reset IDs to be registered
> - use mask for the valid reset detection instead of parsing reset map
> - fixed reset status bit handling
> - used iopoll macro instead of handwritten poll loop for timeouts
> - squashed patch #6 into #4 from v2 of the series
> - some other minor fixes.
> 
> This series still depends on the clk driver changes for the reset<->clk
> syncing [1].
> 
This has to wait for another merge window. It will also take care of 
dependencies landing in mainline. Will push this to linux-next as
soon as v5.4-rc1 is out. Please remind me in case you don't see it
in next after 5.4-rc1.

Regards,
Snatosh
