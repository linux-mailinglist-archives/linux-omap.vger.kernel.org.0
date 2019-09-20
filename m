Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D62A5B97B9
	for <lists+linux-omap@lfdr.de>; Fri, 20 Sep 2019 21:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbfITTUb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 20 Sep 2019 15:20:31 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:41632 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfITTUb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 20 Sep 2019 15:20:31 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8KJEGx6115790;
        Fri, 20 Sep 2019 19:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2019-08-05;
 bh=NTgWiBq1iOSn7E4DUsV0oOzifM6YvCmeXgLvP8GhXpQ=;
 b=YJKcSsRRnT6afxtXsPMppGt9Rgkn3BMTmHFs4rS80XEMtJlg07xr3xOg0BkHYrBPE0P7
 plAegF0BTsqJu3KYg89buLvo30tikcoaGPK7xcVr6YI2vauuoTBbUT6nOf9U7dlcdRad
 ksMXwxFoKnzLkVIwm1/8z4NUq81YrXd97kh5mglsvKTBdG7cLzQPpCn4LQxC0MVhvIOP
 46S2wPdldNUvautuBloWAPBCLrIvnJ4sZIpXw/RApFzhFx8Y7C0tXE3rxpMAv5RjaBz1
 Qk4KFmbHZsXoFcpggeo6XsUZ0bp4GGdmKQeQOTQFugjOmL42rH0tpChD4HavXf+SaMnj bQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2v3vb5cb1m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Sep 2019 19:19:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8KJJWuj126991;
        Fri, 20 Sep 2019 19:19:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 2v4vpmtufj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Sep 2019 19:19:59 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x8KJJvCb002952;
        Fri, 20 Sep 2019 19:19:58 GMT
Received: from [10.209.227.25] (/10.209.227.25)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 20 Sep 2019 12:19:57 -0700
Subject: Re: [PATCHv5 00/10] soc: ti: add OMAP PRM driver (for reset)
To:     Tony Lindgren <tony@atomide.com>, Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, ssantosh@kernel.org,
        p.zabel@pengutronix.de, robh+dt@kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20190912113916.20093-1-t-kristo@ti.com>
 <20190920142849.GS5610@atomide.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <13a77bd8-72bd-6a44-9141-d5492be82d82@oracle.com>
Date:   Fri, 20 Sep 2019 12:19:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190920142849.GS5610@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9386 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909200156
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9386 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909200156
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/20/19 7:28 AM, Tony Lindgren wrote:
> * Tero Kristo <t-kristo@ti.com> [190912 04:39]:
>> Hi,
>>
>> V5 of the series, re-sent the whole series as one patch was dropped.
>> Changes compared to v3/v4:
>>
>> - removed dependency towards clock driver (patch #5 was completely
>>    dropped compared to v3/v4)
>> - dropped clocks property from dt binding
>> - re-added the pdata patch which was accidentally dropped out (it has
>>    dependency towards this series.)
>>
>> The new implementation (without clock driver dependency) relies on the
>> bus driver to sequence events properly, otherwise some timeouts will
>> occur either at clock driver or reset driver end.
> 
> With the two updated patches seems like we're done with this
> series?
> 
> If so, I suggest either Santosh or me sets up an immutable
> branch against v5.3 or v5.4-rc1 that we all can merge in.
> I will need it for the related dts changes at least.
> 
I will pick this up Tony and apply it once v5.4-rc1 is out.

Regards,
Santosh
