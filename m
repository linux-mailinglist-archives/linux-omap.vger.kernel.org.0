Return-Path: <linux-omap+bounces-1194-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 642088A4FB1
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 14:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AFE71F217C4
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 12:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D5F8005C;
	Mon, 15 Apr 2024 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h42Oc/7Z"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCA97F7FC
	for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185377; cv=none; b=T1kM4emWiFhk1EYkEQ2iY4Rpye5DJ5d6W0Qp9XSF3zZPrzhz4xbM6v0PLm9btTYDZ0yyYKT5lVXtI7bI1osPrP2Om4DtZ8NWLVm8oyoA9ItsXDbzpEXZLRpchd+vmzRMX9/KcoddHvdVsTIYhKVSolmHlh+ssI+jtEVDwPMp5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185377; c=relaxed/simple;
	bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXg7EJDu/t/VXtMFWOV7Bb+8xZJK3/8RwXIIxs4CDyYa/6G89Asf2zFbOt6S4Ro8u7Ky37qNLbTKXp35EYIqjsCRjQMjUBfNC+KdymMeVec8iThbaLLPEcquhNrsYZEG5+GoLTlbVNbZxe5OYsPpG8Tfvw5aMxu6fXtvJ/ELdZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h42Oc/7Z; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3465921600dso2839749f8f.3
        for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185374; x=1713790174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
        b=h42Oc/7ZaIDppUj9LBgMtk36CPgay2mkB6FjNXTWYcpcJS1EKTHZhd4R9+wbPhLeeE
         eD2LJR+pwSN2Pq+WKr+qvs7vl+wrkz8LglHmA/GzqpuHJYGw04yNLBSh01tyGL2NmhUU
         CneZggItfMkbLqoAPtkpSmuxSNT+abgnRrzc1vDdwpH2mxUjjwu2FhyYEsr5MzJXmOQr
         wAuAO3y6x2FKz+WUjzWFTejCqfHFlrneCAtGfAaVAODeKfE6dE7kQqrtxuC7YgHOEMvg
         +/E1TYCT6bMulQep/bk33kTXywBOT3vueCWsfMJoq9KXZYF3tLacGVATaCWQvn6B/BVs
         p1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185374; x=1713790174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
        b=wgHr+1Io8U7hIb1W4KOKxHkWnaKOxyx4XuiEEj6iOhBhV3ygaGiuIR+k4mM5XE+Zpa
         Bv0LBg+6V7hG4ZryVf0x94WO8Zo3qi8mgS/AUj0GVHUGx69PoSu6qn+p2KbZVHA52Yao
         G5AwinO5ugTB4CZ+HLkoBk8GO6dG2PdQPpqlfQVfSvNEAG5Sh52lJlNyEF15QhGeyzXJ
         KurdfHkH9PyP9utEHr1omza3rlTaAQDPb7piWgpd81NzpEqdyFlxMDoSkDHjvIS7VR+s
         Flb37h9CnRjZqKfSvwNXVnqNn36qhMZBpJXcj6DBQxFaPuzM8Uz8yQwFYQ/G+ycRhfdX
         nHkw==
X-Forwarded-Encrypted: i=1; AJvYcCXMHWg6rx8rI4fi6yOqYIRD0MywKtuB6DdlR4K5ckonKk+u87eu2w6J8N76riIrXm+LrQE20dsxs8ReRt/0liZoBo1m2Cg0ZJbNNQ==
X-Gm-Message-State: AOJu0Yxf4LJ2NzO6C40+31eGXtLbHAxYR5kwpQke4YBQwTQIXod57bIP
	6oziS3mfObZ67bXf8z+7ahq/tj2ez1vC9pPaGYiOs2vDCLW1yK4FW30oYU+ZdmE=
X-Google-Smtp-Source: AGHT+IERNVIb7kkkXkEPWlxI4SlxeSXGIdHfAlszM7dr954BuhwHUlim2WOUoHyibBjW2LFxYJ6i9g==
X-Received: by 2002:a5d:4e0a:0:b0:33d:fb3:9021 with SMTP id p10-20020a5d4e0a000000b0033d0fb39021mr6183299wrt.54.1713185374316;
        Mon, 15 Apr 2024 05:49:34 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b0033b48190e5esm12005471wrt.67.2024.04.15.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:49:33 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:31 +0100
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
Subject: Re: [PATCH 05/18] backlight: ili922x: Constify lcd_ops
Message-ID: <20240415124931.GE222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

