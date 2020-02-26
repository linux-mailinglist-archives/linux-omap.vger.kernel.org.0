Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81196170914
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 20:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbgBZTz0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 14:55:26 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:38590 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727244AbgBZTz0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 Feb 2020 14:55:26 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01QJrUCL006843;
        Wed, 26 Feb 2020 19:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=obe41J39gr3+hCoSli7HOYpO1kiS2+KFKSLxGy0JLdk=;
 b=gpONdCEPR/ZndEU1/LFtbAKuFpUWUMRn+eLahfvWMfMCs0JiRZTEr0+539R69NARSKyw
 yo0B0jTvPEtmUuEGw/O0d7ImjZI9woH/pLK2F6Zh4XHmJfiMTgPFjFq1/+l7y5I57O7u
 s2Q8/eJ17MR7EM1p03n1etCw8x9k4ZosJOFTtGYZ9CQHtbAwyx0pXcAM38yyeIAHcfie
 3tIltLetU1JrA4xUH6oZjiqZ9mYsl0fcUgJ5I7CCeIjQPrd3Rf7tK06AcBiFtVxZbH9b
 TdP0VGRMKkcGoO7SJBxxbIEAz4gP/p8TlEZfXJtAsQfpgE4kFwTnyIDm+qW5q9wH25ud Qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 2ydcsne0na-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Feb 2020 19:55:19 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 01QJiNqO116685;
        Wed, 26 Feb 2020 19:55:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 2ydcs2yfc0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 26 Feb 2020 19:55:18 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 01QJtHtY028983;
        Wed, 26 Feb 2020 19:55:17 GMT
Received: from [10.209.227.41] (/10.209.227.41)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 26 Feb 2020 11:55:17 -0800
Subject: Re: [PATCH 0/5] ARM: OMAP2+: Introduce cpuidle for am335x/am437x
To:     Tony Lindgren <tony@atomide.com>, Dave Gerlach <d-gerlach@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
References: <20191213030755.16096-1-d-gerlach@ti.com>
 <20191213150344.GJ35479@atomide.com> <20200226184328.GY37466@atomide.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <5d775a75-3013-fac2-91e3-ac1967b0f698@oracle.com>
Date:   Wed, 26 Feb 2020 11:55:16 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20200226184328.GY37466@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9543 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=801 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002260120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9543 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=861 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002260120
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/26/20 10:43 AM, Tony Lindgren wrote:
> Santosh,
> 
> * Tony Lindgren <tony@atomide.com> [191213 15:04]:
>> * Dave Gerlach <d-gerlach@ti.com> [191212 19:07]:
>>> Hi,
>>> This series adds support for cpuidle on am335x and am437x using the
>>> cpuidle_arm driver. When testing on am335x-evm and am437x-gp-evm the
>>> follow power consumption reductions are seen on v5.5-rc1 baseline:
>>>
>>>
>>> Idling at command line, CPUFreq userspace governor to 300MHz:
>>>    am335x-evm:
>>>      VDD_MPU: 48 mW -> 5 mW
>>>
>>>    am437x-gp-evm:
>>>      VDD_MPU: 32 mW -> 3 mW
>>>
>>>
>>> Idling at command line, CPUFreq userspace governor to 1GHz:
>>>    am335x-evm:
>>>      VDD_MPU: 313 mW -> 18 mW
>>>
>>>    am437x-gp-evm:
>>>      VDD_MPU: 208 mW -> 10 mW
>>
>> Hey this is great! A beverage on me when we get a chance :)
>>
>> For merging, looks like I should take the series after folks are happy
>> with it. Santosh, care to review and ack if it looks OK?
> 
> Looks like this series of changes is still pending. Care
> to ack?
> 
Was scanning this series today. It looks good to me Tony.

Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
