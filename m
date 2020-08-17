Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D97F2476B1
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 21:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388283AbgHQTkh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 15:40:37 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:40396 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729742AbgHQPZg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 11:25:36 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07HFBOO6039814;
        Mon, 17 Aug 2020 15:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=cjzdpdXq2OFDNjLcmDZq/8KMYSFbgoAYkIaLS/N63v8=;
 b=GQM5vTa3KX4tNW/94eDAc8RWkTJHAjkLps3epQpWFplyMpUccegmu+Y6TwGgGz7aUlEX
 b8S349zkTNIvIsueSXYeK4TbV6IDqZt4gYL3bQytMpRLGt7WM7AVvuIzhD3rSXzD9jOE
 2fGAUYfealh2XYUl+m+DIVr3ojg3BUZD5GUuXfgDcNFJfRsKOULaZA4357ufHsYk4pTY
 muKIY0LMCLSAj0FGbFbKyNEoN6vgdIhK+FA1N1d9MOTrQkG5CChucs/wOlw2U9tV6iZG
 N5QHttGne1azWqbxNmQTDCXH96uVXRWjx1NyuZ7qt+GHDl+pbUJXkFiOlv9ws9ozRa6U UQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 32x7nm7ghs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 17 Aug 2020 15:25:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07HFEQJZ133060;
        Mon, 17 Aug 2020 15:25:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 32xsfqp2e0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 17 Aug 2020 15:25:23 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07HFPLAl022596;
        Mon, 17 Aug 2020 15:25:21 GMT
Received: from [10.74.111.253] (/10.74.111.253)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 17 Aug 2020 08:25:21 -0700
Subject: Re: [PATCHv4 0/6] Add initial genpd support for omap PRM driver
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>
Cc:     "Andrew F . Davis" <afd@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20200702154513.31859-1-tony@atomide.com>
 <20200817065300.GD2994@atomide.com>
From:   santosh.shilimkar@oracle.com
Organization: Oracle Corporation
Message-ID: <f52bc6c2-1256-a3ca-fede-1d3ab441ef9f@oracle.com>
Date:   Mon, 17 Aug 2020 08:25:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200817065300.GD2994@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9716 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170117
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9716 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008170117
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 8/16/20 11:53 PM, Tony Lindgren wrote:
> Hi Santosh,
> 
> * Tony Lindgren <tony@atomide.com> [200702 18:46]:
>> Hi all,
>>
>> Here's v4 set of patches to add genpd support to the PRM (Power and Reset
>> Module) driver.
>>
>> Initially we just add one hardware accelerator power domain for sgx,
>> and one interconnect instance for l4_abe. The rest of the SoC specific
>> domain data is probably best added one SoC at a time based on generated
>> data.
> 
> Care to ack some of these patches? I'd like to get this into Linux next
> for v5.10 :)
> 
Sure,
Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
