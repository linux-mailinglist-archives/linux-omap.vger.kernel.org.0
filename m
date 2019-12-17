Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE001234E1
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 19:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfLQScd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Dec 2019 13:32:33 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:59434 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726813AbfLQScd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Dec 2019 13:32:33 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBHIOKsX101532;
        Tue, 17 Dec 2019 18:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=VLXwZ5VzJPq80xqOoJ02BnfrcnEH06ja95rpjsHRG9o=;
 b=FktRscK/S0i8JKAK3RlJ0FnUPSu36bjwinHPITvDmRbICU3pb/ck31N+H0J0JiLx9KP6
 PY3WKLkgU7tzyTISWX/fBsamdb/glH3lsurxfEivGnebbrUfjevNQYSw7dICPhUBe2fP
 x46rwR3NNBFjQSSQjgbH40Px6HfBRKPBKyO+OlCCWW/cliCTbpnjt9m9YxRcCN4pG7p5
 1DP8S+SPJqj1VLg5grBe2T8B9t2tzkbsI/ugIhTIRjYYtHBrXnlb3nWPtw/Zo34pwIb1
 mjUs7lhUTbe6m54laArBlrXvHVDUrAfchsqiOu4Gs9Ahr6LWMHC5twmQtcUwMZqrkzOa zw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2wvq5ugnp1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Dec 2019 18:32:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBHITItG081367;
        Tue, 17 Dec 2019 18:32:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 2wxm5nng97-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Dec 2019 18:32:18 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xBHIWFSH006455;
        Tue, 17 Dec 2019 18:32:17 GMT
Received: from [10.10.32.221] (/10.10.32.221)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 17 Dec 2019 10:32:15 -0800
Subject: Re: [PATCH] soc: ti: wkup_m3_ipc: Fix race condition with rproc_boot
To:     Tony Lindgren <tony@atomide.com>
Cc:     Dave Gerlach <d-gerlach@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Suman Anna <s-anna@ti.com>
References: <20191212040314.14753-1-d-gerlach@ti.com>
 <20191217182534.GD35479@atomide.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <05b9f0ff-bbc2-d8a7-3261-54c03a149db8@oracle.com>
Date:   Tue, 17 Dec 2019 10:32:14 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20191217182534.GD35479@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=867
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912170145
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9474 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=930 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912170145
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 12/17/19 10:25 AM, Tony Lindgren wrote:
> Hi,
> 
> * Dave Gerlach <d-gerlach@ti.com> [191211 20:02]:
>> Any user of wkup_m3_ipc calls wkup_m3_ipc_get to get a handle and this
>> checks the value of the static variable m3_ipc_state to see if the
>> wkup_m3 is ready. Currently this is populated during probe before
>> rproc_boot has been called, meaning there is a window of time that
>> wkup_m3_ipc_get can return a valid handle but the wkup_m3 itself is not
>> ready, leading to invalid IPC calls to the wkup_m3 and system
>> instability.
>>
>> To avoid this, move the population of the m3_ipc_state variable until
>> after rproc_boot has succeeded to guarantee a valid and usable handle
>> is always returned.
> 
> Santosh, do you want me to pick this one into my fixes branch?
> 
Sure, go ahead.

Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
