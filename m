Return-Path: <linux-omap+bounces-4859-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3557C382A2
	for <lists+linux-omap@lfdr.de>; Wed, 05 Nov 2025 23:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1B55189B5A1
	for <lists+linux-omap@lfdr.de>; Wed,  5 Nov 2025 22:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC832F1FC8;
	Wed,  5 Nov 2025 22:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayjMRaPz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87912EE5FE
	for <linux-omap@vger.kernel.org>; Wed,  5 Nov 2025 22:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762381095; cv=none; b=OM9CArd0RklL8Rv5flW39Ma7VocML+yhkxMOY0o1ethrjTkudJDCyqi6SJE9yc4dtaBZS7oikMoGbzt01OloTviZNBWkveQ/TjVHZy2OB5FlVs/29kqR69+HEFG7jQlbutwz7Uiqw24LTfIwbPcV4UnbHGhTPNgVaVLS/5erQ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762381095; c=relaxed/simple;
	bh=FgSHmdWK8fD86bwRD+NZMD0W0N6z+nayNo+9iUVv+Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ok8eYwt2yVK5pPlKQO+KqFQ/MmHkRvFHn0r+8LWdcWkWcDV2+Pb7E+NN/R4pSyoFvRzMjwvtxBIQoaeh54gEh8x5QDIr8HWMWt3/j+PAvOkrYfBv0SdrGdofBv3netOamjmE8sKUmf1dTFKpZTxZ3lWGjyvRxZuScm0A2VYIKXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayjMRaPz; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34188ba567eso319440a91.1
        for <linux-omap@vger.kernel.org>; Wed, 05 Nov 2025 14:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762381092; x=1762985892; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Im7C/yPVX9MxQ3wIFuOi8MGfdZ4IZni92LwvcWpKIGs=;
        b=ayjMRaPzv1xu7dmY/OaJsI/1A7EsC3QCEOV7CGR0Bg6ZTRXjC7dBZa0y6B9KjqsQrU
         1+2wZr+jYdfRCNMS+zbe1nRoorC9EztQ+ppXTe2gX0tkfhV1LaDZ4nTd0xAI5MPmro0R
         4eiPeOOs1vNV23BdWGi9+Sd9OTX/ja7ja24wvfvquPmjXw0cvft5biFO1yAEpwZ1CLTs
         LHoHKSBzNNRFmYXnJKfQOyFF9GVqpA6xpfGG/ZKGMdZaCOhdR5VWAgTHu262I7Zqu0S1
         QkX93ekiQZyUe+h9akbySFOP2AXbRaLbF6CNBMOBSgUlyH2JSj4OOqimdEXf2kU3uP04
         BFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762381092; x=1762985892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im7C/yPVX9MxQ3wIFuOi8MGfdZ4IZni92LwvcWpKIGs=;
        b=HU8WQP4bpjhQRZqvVa7vPVUggoIrV2VdB/Q8Lri2ogZjyPD8+gWG4Bl4DRTU5UC6pY
         wq8MKeZAlOrKjmqFGJklHtDj0q4ek3dhkPb3nx5SrnpvjOH+5jHaw7tEQT9lxDs12n0Q
         gu1R7mpfK0F9u9e+L7VilvKtdpiM2uKwij85xtfLtGhjdAOAKDSptXdM+CTnNP8FWw8t
         1SkpryZoYlC/6nCA8JzOD4Z5X1ab0jDU1vImO/WbnYZ8cGLNjkXffx82FOOkpOhPbtQk
         StHD9g3FZN3IiOWN3vmTFay6awrz/uTUmC6uJJdo1mDGf3mA8Clvvpo+TD0xVRfMEp4n
         AY7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxxyH7pkrhzgdRVy1BCqg5tM71vS3q/PXxer0JV54/LBGBOS7twM4a14SP4cTfW9aWDq4G/OrxR0XQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyJtoV9ZrSBp+W31UrNwGKIG5StsUFghtwC1I/AQXsjjm3QSbMX
	2qcBn5rHtphR3GDLHHfs9UrinOXEJcLvKR+invCz+tPVQqfC/uzeBSzkkrajPw==
X-Gm-Gg: ASbGnct6x1M8KA25Hk6OWEHt47sUl95QVGo9jcE8iSGXyyxFd/rNcv2HhkHyvpf846D
	zBqmhtMVc/JZhiksyhPcTDENISZhytk6I+JsEFFK24dQT5y6C9/yZOIsdSJnCltk0XiGF8E0JmL
	zRt9P4E82OaK+ar6YNnjvBtoDRrEyXw8tjCuFTfhV/IjSGVkgs+hQsL6tTRe2Vqqn6dsNIfS2O5
	alPVh8zGM094kjI4RlRT/Krxw+sDJiRBFtWsi1fvulhYAG4p6Sp7UR/ewSd+/Gpyr8wBUj/IxeQ
	+6EcdZaGwu+Lwmv8eQfrfrvPFZom5UfPtA8lZp+VfYMiGe633lCepUOAb8/bTWbkvUnniuaGfoM
	rPlyrDy9BVE+gdQT9scgm/rXhTMeGZ2vWDgqeEBlDYl5CkuraZbPwwwUSSlMOLdcnG98spCufJU
	c1esoCdZADHQvbHSn2ghFtZWq//Hgy2A8f8Ywf3a+5dLlIJDZAclcx
X-Google-Smtp-Source: AGHT+IGMYKxUc+yFWPCSR1IktVa+NNpsyxMZ4O/wnRPrxacZqCnZibSpr1AmWZE5WIphsK5cnjwcSA==
X-Received: by 2002:a17:90b:5250:b0:340:c179:3666 with SMTP id 98e67ed59e1d1-341a6c1e314mr6059131a91.8.1762381092040;
        Wed, 05 Nov 2025 14:18:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:35dd:7def:e1d1:adfe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d05c982dsm238658a91.20.2025.11.05.14.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 14:18:11 -0800 (PST)
Date: Wed, 5 Nov 2025 14:18:08 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: akemnade@kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andreas Kemnade <andreas@kemnade.info>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Input: twl4030 - add TWL603x power button
Message-ID: <tyx4vvapd4pca6e236rcjkbxecor5kderzoinbwyuecdclzcix@jgksmvfioc4x>
References: <20251105-twl6030-button-v3-0-9b37eb2b0989@kernel.org>
 <20251105-twl6030-button-v3-2-9b37eb2b0989@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-twl6030-button-v3-2-9b37eb2b0989@kernel.org>

Hi Andreas,

On Wed, Nov 05, 2025 at 08:52:36PM +0100, akemnade@kernel.org wrote:
> From: Andreas Kemnade <andreas@kemnade.info>
> 
> Like the TWL4030, these PMICs also have a power button feature, so extend
> the TWL4030 power button driver. As the irqchip of the TWL6030 mfd driver
> does not provide mask, unmask finctions, do it manually.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/input/misc/twl4030-pwrbutton.c | 61 +++++++++++++++++++++++++++++++---
>  1 file changed, 57 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
> index f85cc289c053..b72fba9a1b2c 100644
> --- a/drivers/input/misc/twl4030-pwrbutton.c
> +++ b/drivers/input/misc/twl4030-pwrbutton.c
> @@ -25,22 +25,40 @@
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
>  #include <linux/input.h>
> +#include <linux/bits.h>

Move to the top of includes please.

>  #include <linux/interrupt.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/twl.h>
>  
> -#define PWR_PWRON_IRQ (1 << 0)
> +#define PWR_PWRON_IRQ BIT(0)
>  
> -#define STS_HW_CONDITIONS 0xf
> +#define STS_HW_CONDITIONS_4030 0xf
> +#define STS_HW_CONDITIONS_6030 0x2

Probably no need for these defines, just use numbers in structure
instances.

> +
> +struct twl_pwrbutton_chipdata {
> +	u8 status_reg;
> +	bool need_manual_irq;
> +};
> +
> +static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
> +	STS_HW_CONDITIONS_4030,
> +	false,

I am a big fan of named initializers, so maybe

	.status_reg = 0x0f,
	.need_manual_irq = false,

?

Otherwise looks good.

Thanks.

-- 
Dmitry

