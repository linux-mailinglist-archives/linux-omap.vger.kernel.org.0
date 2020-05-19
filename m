Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2851D9EC0
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 20:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgESSEX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 14:04:23 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:57014 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgESSEW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 May 2020 14:04:22 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04JHpj7k050572;
        Tue, 19 May 2020 18:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=M6R/9jCPPjZ0Z40jIhYBTQf+9wpABaTJMFO+RN34OXA=;
 b=x+YXCZzBmbzN9frri30aQU4Rzx1EPD/SrJ8k4Ng/E0VhVukGXQJbWVL51owiEWbNAK8a
 UCu9y9zIFOeI6pPJnSu4ynOMmG8hLX0Woq2wIxGv7eM/9pfsTFkKqOIBKI5seAueBzsF
 Etx5w+iZ5uAVz01XmqDQ8TwCk4yC6Pk7Sr1L9B1ZWPenwUPI4s8NY4lxV9jbfvwr6c1B
 Ssa6WhyTiwZxo4WDAlngj5FjD+1ADVz0hKacWl5uItoYup/FjtxEM8Xoz773XuTcqtxr
 MtyZeRWLxJeHUijeLi1oXQ/PR/J0QU7l67CJp9I0l1v1jK2LueyD24ebestsMtS8Tf6W kA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 31284kxyyp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 May 2020 18:04:10 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04JHr8nq110322;
        Tue, 19 May 2020 18:04:10 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 312sxt8kj9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 19 May 2020 18:04:10 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04JI483L016827;
        Tue, 19 May 2020 18:04:09 GMT
Received: from [10.74.104.239] (/10.74.104.239)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 19 May 2020 11:04:08 -0700
Subject: Re: [PATCH 1/1] soc: ti: omap-prm: use atomic iopoll instead of
 sleeping one
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
Cc:     ssantosh@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        s-anna@ti.com
References: <20200514073718.17690-1-t-kristo@ti.com>
 <20200519174555.GX37466@atomide.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <eff0d78e-7e94-6574-6b17-f3293ef55918@oracle.com>
Date:   Tue, 19 May 2020 11:04:06 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200519174555.GX37466@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005190153
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0
 cotscore=-2147483648 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005190153
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 5/19/20 10:45 AM, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [200514 00:38]:
>> The reset handling APIs for omap-prm can be invoked PM runtime which
>> runs in atomic context. For this to work properly, switch to atomic
>> iopoll version instead of the current which can sleep. Otherwise,
>> this throws a "BUG: scheduling while atomic" warning. Issue is seen
>> rather easily when CONFIG_PREEMPT is enabled.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> 
> Santosh do you want me to pick this for fixes?
> 
Sure Tony. Thanks !!

Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
