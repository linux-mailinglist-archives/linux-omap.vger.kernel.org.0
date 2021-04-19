Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2649363DD5
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 10:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236613AbhDSImB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 04:42:01 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:51664 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232457AbhDSImA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 19 Apr 2021 04:42:00 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13J8bA9C030765;
        Mon, 19 Apr 2021 03:41:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=l5+6B7yLlGexdRNqulfmrk7QUU3NakJuFOXcvZvkBzw=;
 b=lKkgp2f4Bx/jYE6E5x6+YZ6VPzXBZwHpvsj7Rpa5OoJZKvi0JZg0pq9SKgZX3hXzgwSM
 wgagARAsGwPZKn8DwY3aV0UgfNRIrpNNnpE13HI3cUCgzxpD3C8sdJrDkibwDquXKGil
 j6HXT1wT798AqDlwyhZlZotZgmn2xj0MoOuaKhNw2H5QCiM8Cw4LXYJLen4kRnykG3SS
 gSZk2SBsVS4QXV9GrIxHP/8F5IgI+ajspKtkQU6ZCCeohjKUqaLTjqYpkgs71QC4EoHP
 ghhdyQnBQ+Zju/b+1EPHr+Q3w4DLIWv7lsYw+vcvovRPRxVCi41ruPL7KldLTfgys2xG Gw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0b-001ae601.pphosted.com with ESMTP id 37yv3p1rvb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 19 Apr 2021 03:41:21 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Apr
 2021 09:41:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 19 Apr 2021 09:41:19 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B2A9711D1;
        Mon, 19 Apr 2021 08:41:19 +0000 (UTC)
Date:   Mon, 19 Apr 2021 08:41:19 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH 6/7] mfd: wm831x: Correct kerneldoc
Message-ID: <20210419084119.GA64205@ediswmail.ad.cirrus.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
 <20210419081726.67867-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210419081726.67867-6-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Q2RF33ynHf2NJvfCE9DdZTH4wK4FrB7U
X-Proofpoint-ORIG-GUID: Q2RF33ynHf2NJvfCE9DdZTH4wK4FrB7U
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxlogscore=870 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104190060
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Apr 19, 2021 at 10:17:25AM +0200, Krzysztof Kozlowski wrote:
> Correct kerneldoc function name to fix W=1 warning:
> 
>   drivers/mfd/wm831x-core.c:121: warning:
>     expecting prototype for wm831x_reg_unlock(). Prototype was for wm831x_reg_lock() instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
