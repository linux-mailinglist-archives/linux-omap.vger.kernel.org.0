Return-Path: <linux-omap+bounces-1729-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F20A927F90
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 03:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3402283867
	for <lists+linux-omap@lfdr.de>; Fri,  5 Jul 2024 01:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED6FEEDD;
	Fri,  5 Jul 2024 01:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="KMhlXA67"
X-Original-To: linux-omap@vger.kernel.org
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DEA955;
	Fri,  5 Jul 2024 01:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720141869; cv=none; b=rJpVaUAZPMdYZ8gfAEHyV0hjpaSXrp2PifRizM8cH7ecEk9t27J8nmbNaXx6mxIEkBsfh6uOqnc9y+kzv6zAMFkCc0h1Np5tlrKTj7PRi5Wkr51BZxrKSHEcy+j1gKpZRAPatxUBV1DUiFcdeAVdwfpOmLh22i7OTpVfvB1PHgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720141869; c=relaxed/simple;
	bh=VGpxTY3Cl7n8gTKacUWaqDgSMZp1Wy4BOGGFoP5h0MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=We2vGF5/5Xs/4HRK67BIV7JMUMb2EuUcufbbDY/8/jys598op6bfn2kNw58tiLQxkETIw+9Y8mP1BGXehFVN73h34wegl+uNNLYAUZJr/ydeE/BDqaMUkm0Oe1f8l+2KGIYn3YRlfLUX66cZi9QQh5gSYlcTrmU3LhdIYdOkx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=KMhlXA67; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1720141864; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=hXZ31O+6OGHZHIC96Y9JGlHNNL0xhEUhHueZyNuerU4=;
	b=KMhlXA67dAP26URXKKp1um/arly8mRYzzYQQRPlhfoauVz+xuAoCDEZQiFg52l5y9nGGhgNUzsXmU7/WhcJ/GQaL+QviKDor1gHzCZ+h33+VQMKWNCUadM3Pmqlz2O2Yj9WIUue0PaBF8Dy3vE+3FPXV87T2mzLGQoy04vtu81U=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037067112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0W9snHsr_1720141861;
Received: from 30.97.56.65(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0W9snHsr_1720141861)
          by smtp.aliyun-inc.com;
          Fri, 05 Jul 2024 09:11:03 +0800
Message-ID: <a46a766e-92f3-4dcf-b34f-cbeecc3b170b@linux.alibaba.com>
Date: Fri, 5 Jul 2024 09:11:01 +0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/24] mfd: sprd-sc27xx-spi: Constify struct regmap_bus
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
 <20240704-mfd-const-regmap_config-v2-24-0c8785b1331d@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-24-0c8785b1331d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2024/7/5 01:23, Javier Carrasco wrote:
> `sprd_pmic_regmap` is not modified and can be declared as const to
> move its data to a read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Thanks.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

> ---
>   drivers/mfd/sprd-sc27xx-spi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
> index 81e517cdfb27..7186e2108108 100644
> --- a/drivers/mfd/sprd-sc27xx-spi.c
> +++ b/drivers/mfd/sprd-sc27xx-spi.c
> @@ -135,7 +135,7 @@ static int sprd_pmic_spi_read(void *context,
>   	return 0;
>   }
>   
> -static struct regmap_bus sprd_pmic_regmap = {
> +static const struct regmap_bus sprd_pmic_regmap = {
>   	.write = sprd_pmic_spi_write,
>   	.read = sprd_pmic_spi_read,
>   	.reg_format_endian_default = REGMAP_ENDIAN_NATIVE,
> 

