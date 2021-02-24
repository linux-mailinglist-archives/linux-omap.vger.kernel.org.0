Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D9A7323821
	for <lists+linux-omap@lfdr.de>; Wed, 24 Feb 2021 08:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbhBXH4z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Feb 2021 02:56:55 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:51230 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230459AbhBXH4x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 24 Feb 2021 02:56:53 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11O7o6E9167503;
        Wed, 24 Feb 2021 07:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=B3Rx9g/G1eftg47QpZJeIvSXopnPcakmqucJsFsfr00=;
 b=r/OXgbigBvJqnM9DBMdYJ0EmYbxZIaaAxKHiEBdekd416odgZGdgG5SiTgLQTOkrXSkb
 quHG8Fo9niEs0v/Ru8D7kvPuDVI/bJT8ZaeEKaE9pUVqlBl0Xqqvw+Kb0lLID2cIum1X
 96bMcJqyyTA/OGdJPc+kNKodOwvNmq+AyuAPRv+FD3qvC91gNCDTENkrOrxSMC59xGV6
 WLHZvhYN5hWY8QHlG6HFbT3TrRN3Kwi3q0OFq1LVIKzZLWsHiQq0nwDd6zcfnw6BylUw
 NRcFgVAvM3vct+ceYFFk/Ol9LM//AfZG0GGH+8nnadCl6td5EzSr9if65cCZ0Wb/M910 PA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by aserp2120.oracle.com with ESMTP id 36ttcm9yky-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Feb 2021 07:56:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11O7odE0084378;
        Wed, 24 Feb 2021 07:56:02 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 36ucb0dpmq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 24 Feb 2021 07:56:02 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 11O7u0LC017071;
        Wed, 24 Feb 2021 07:56:01 GMT
Received: from kadam (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 24 Feb 2021 07:56:00 +0000
Date:   Wed, 24 Feb 2021 10:55:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: gpmc: fix out of bounds read and dereference on
 gpmc_cs[]
Message-ID: <20210224075552.GS2087@kadam>
References: <20210223193821.17232-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223193821.17232-1-colin.king@canonical.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240062
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9904 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240062
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Feb 23, 2021 at 07:38:21PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the array gpmc_cs is indexed by cs before it cs is range checked
> and the pointer read from this out-of-index read is dereferenced. Fix this
> by performing the range check on cs before the read and the following
> pointer dereference.
> 
> Addresses-Coverity: ("Negative array index read")
> Fixes: 186401937927 ("memory: gpmc: Move omap gpmc code to live under drivers")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/memory/omap-gpmc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index cfa730cfd145..f80c2ea39ca4 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -1009,8 +1009,8 @@ EXPORT_SYMBOL(gpmc_cs_request);
>  
>  void gpmc_cs_free(int cs)
>  {
> -	struct gpmc_cs_data *gpmc = &gpmc_cs[cs];
> -	struct resource *res = &gpmc->mem;

There is no actual dereferencing going on here, it just taking the
addresses.  But the patch is also harmless and improves readability.

regards,
dan carpenter

