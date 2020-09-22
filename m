Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCF0273DFE
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 11:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgIVJEN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 05:04:13 -0400
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25]:50136 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726419AbgIVJEM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Sep 2020 05:04:12 -0400
X-Greylist: delayed 791 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Sep 2020 05:04:12 EDT
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 08M8mcne014151;
        Tue, 22 Sep 2020 03:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=33FVCmPMgGc58dv+vbwbE5DFLzNJiEbShJOONMKdb04=;
 b=hAszrCEV5hXZtpqpubUxK3NzShY5kDkvkyviZM7R4d0Oq5NgU+MeVJwPnm9qc8W9oE47
 fhAtwFsg955FUmBIkT1ukz+Wh/8KgIjviVSVZxf+VWYS29t763ZN+kVOWcin3u3b+3oL
 DifWAQgswvROfXvfpGNCblZqIEh761+RLvKlCW/9kGY92urkGgKUgY8OzBdyHebms/OY
 TWLP1ay7iawI5tdfdcDYjCcEkuIs1frDd/AsagH/a6XOdTy34nMtZnMjgoKK5CYkdxGA
 otepGFLIC/6Px317jPo60DYn111CWWsKbDwmXjRDJ0vzXQCqPSaZeVIL3Y2TfpW4vMLp yg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
        by mx0a-001ae601.pphosted.com with ESMTP id 33nfd23dav-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 22 Sep 2020 03:48:50 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 22 Sep
 2020 09:48:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Tue, 22 Sep 2020 09:48:48 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4DEF945;
        Tue, 22 Sep 2020 08:48:48 +0000 (UTC)
Date:   Tue, 22 Sep 2020 08:48:48 +0000
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
CC:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 42/42] mfd: wm8994: use PLATFORM_DEVID_NONE
Message-ID: <20200922084848.GT10899@ediswmail.ad.cirrus.com>
References: <20200921205016.20461-1-krzk@kernel.org>
 <20200921205016.20461-42-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200921205016.20461-42-krzk@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 mlxlogscore=624 adultscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009220073
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 21, 2020 at 10:50:16PM +0200, Krzysztof Kozlowski wrote:
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
