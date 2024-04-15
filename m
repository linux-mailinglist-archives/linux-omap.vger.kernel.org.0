Return-Path: <linux-omap+bounces-1199-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E1B8A50A4
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 15:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20ACC1F22321
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 13:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FDA82D89;
	Mon, 15 Apr 2024 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rlAA7S3N"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF1B82D98
	for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185668; cv=none; b=HMsv6y9y2sQfDH00KKh2oaBkZklY/JCWA4E84OY/po6qsblFEBsuwlD40wCrzJCsMw4QJoXG3QytqcpDujgZ0uuzJExBbM6fhi5JglGANllf1tmLWmVnv1r3H4CuYbu3cJ2Cxl7g2U6Qcd4tkiPHT/fVIqfTp2Kn+C36R0qPEd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185668; c=relaxed/simple;
	bh=6hy9MHFehUy/zuX4NYpy8UxQhRHJAuB0rX2A35+Fa/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMRA4F5g8zFuUKQkww2Cwe9b3yEyxHu+6PRBKVzc615svVdQ6BfullLSUsM5DEf3GpHyRSLkhmMrB2XBI4QDOa7s6YQS7ycQIZaR4VElbZMJshmLa+faj7/o6y9TqH9Fic3GNnETHdUlj/8rZS6fB+kBNzEBpWK1r3YmrdiHAeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rlAA7S3N; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d895138d0eso24427001fa.1
        for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 05:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185664; x=1713790464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6hy9MHFehUy/zuX4NYpy8UxQhRHJAuB0rX2A35+Fa/0=;
        b=rlAA7S3N3Vgt/FjbnrDGQI0IeUDXdQYkzdF405wlU3tAIj54eneHEXybGcCxRdCd/0
         PO7101V2peiftQ72u0hX0t0SDBYoRh++JFuGSApL3qd4AHxe+5VUx8tHphtWis/s5+Me
         KVYPXEAiIee8ZVV/IleXpCOrh5yOOzyWqDXGBNNHhOdUeBJ9zgx0OhbGD87pLLd4hVW2
         wNtVr+eXSBwYxf5VeTJMxreANDr+1DBgg69VebxyjrWZn5n3HpmmOKmgCdd7S6VPw0Wp
         u3SwcM1su1ldiwQ2mzpUsTZxFDAQ9SfuTK+sG9z8xKMl93Slmm4eBt2nCrPrRePhVNjs
         Fgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185664; x=1713790464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hy9MHFehUy/zuX4NYpy8UxQhRHJAuB0rX2A35+Fa/0=;
        b=u7spMJuBalapN5LsVmf/K/9yNSLn4LOdM1oo8xvSr5ziuifRaC883EpvJgZdqY5Iiw
         M5TMRtg+vYJZZhwHHg1DeauqGL9sAkn9Zkoi9vkAiKTVOU34nsdQwYSyF1P12Fs5Qa9D
         kkMb5NASCNTqn/lgxlB6ooo7Er6z6rVqoW2pqXMS9SU6f+FOPw0lk+6g+ddg+r7TRI2z
         Nfuiph4DkrJH9Vsr1SSzf9HWFQ5jGQXq0bRZPvxPcb9xWQcD2Cs9I3ZbT0MBCaOloibd
         iMTezANkmtTIumKe8fxsmSP5gmx6Z/JMJ4N3ilLQoL+0MNNexemBrWvGHRhhnEFhalLa
         RoMA==
X-Forwarded-Encrypted: i=1; AJvYcCXofOyLmrWK61oyOQ43QM6K37rOMaChj/WU9XmOGWLIzci4GTDNgxQqix4JfDM51lTmNg/QxU8rKqzoORnXIAIf4TTuaiaSZn2PTQ==
X-Gm-Message-State: AOJu0YwlaVv/M1vlJDYP+AoCMocQHeIYzOdm8N5dMpmc4Zrkas/haceR
	NpjSfb2ngK+tCaZESTgtjlwPU1p+Qfb2hIiRVSUMnbvFh/XTjAw4HlvdKiSuGpI=
X-Google-Smtp-Source: AGHT+IHWAIlGaPkDWCdPgAXfWq/+MLUcSYotiH9LGBzmKnQ4SFxdrNrzwncOrZpKE9P8st08sqCGFg==
X-Received: by 2002:a2e:7a16:0:b0:2d2:4637:63f with SMTP id v22-20020a2e7a16000000b002d24637063fmr5787093ljc.45.1713185663909;
        Mon, 15 Apr 2024 05:54:23 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b004181ed7c033sm9730638wmq.24.2024.04.15.05.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:54:23 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:21 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 10/18] backlight: lms501kf03: Constify lcd_ops
Message-ID: <20240415125421.GJ222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-10-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-10-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:08PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

