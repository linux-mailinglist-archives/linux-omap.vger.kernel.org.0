Return-Path: <linux-omap+bounces-1197-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6778A5092
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 15:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94728287E48
	for <lists+linux-omap@lfdr.de>; Mon, 15 Apr 2024 13:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EBC13B5A6;
	Mon, 15 Apr 2024 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lg3x65O8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781AC13B2A4
	for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185619; cv=none; b=prNh47Db3IAXKX5GB1r/44wCjmOhZbDfY27HVxXv2jJa7y4+2zvamPNB37MRYgiXbWF6kL0G55msdrjI9u++loPdvvy9xl66rKihCl8G3s/5ebaQbnXy63VVHA2ggkVaeLEVWfpXk5FtFGE3aH1FpFAOwU3gYNFc9g06gGMwvmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185619; c=relaxed/simple;
	bh=mHsCAGKbKeVfl1gaf61CGCnVc92+Gj0VNSeDerofu3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cT8gYbiFksNBEzA8hAdSHRzeIAo4N+5wJFy8ofQz9S+vQXoTWRQYIL0Q0STbvH/KTr5dzufNnr1yXKTEUuh2odGEZkOx9KkkEZ98plcmtzfW0OX3mn4TMIHatXdusIbSvPSQ0RKiMD5jhLXbiygkRu+iia1KDC9YjgtTr6EtfXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lg3x65O8; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4187731a547so3099605e9.0
        for <linux-omap@vger.kernel.org>; Mon, 15 Apr 2024 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185616; x=1713790416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHsCAGKbKeVfl1gaf61CGCnVc92+Gj0VNSeDerofu3E=;
        b=Lg3x65O8jqJXNBm2NS8j1qNs6jfUj5+ehqF6DIe4JKTzGtGfGnoDCacBuT6iDP2RtL
         d3n2ZzWIiit3WlwlmoVe5zHoA4JZDUVDtjU4HvQmpUjSvBzoYPzRJ13ickiIAkG/pJu8
         QCbujb2CgrOOjehcsi4+9pmbSQnT9Bd/E414P1Eu2dIrkrL8g6xrMkjKk8R67dMfqUuJ
         4DSKLkTULYIBxW9k7rRmjWtGv7YMemzb5FzbuLM6Efdr2LJSo4i7M8nyu6ko+pL8w99w
         TVe1PqygWWXE55VEhDLhQ5zlxmLLD7vjzIhMILgBIiM8gXyNW1TeT9wvKthBC9CEJEth
         fY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185616; x=1713790416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHsCAGKbKeVfl1gaf61CGCnVc92+Gj0VNSeDerofu3E=;
        b=MWCIMuuoV6a5gPH14PVwat/T9zW1Z/7imIogsXeKBYiQO2JkGfZ6z9u+rboTJHte7D
         +IqWM1aDWcnMgv2tOwdL/cNAT/bV6+86/sWagUryeI4b+kobR1yPEVYoO/vQ0KtVDk7R
         q6JnfE1/L7cSgl1lX7mFac6HdtSxcp8sKUqGS9xx90R6z83DIQ0Ktra/03tWhKVwbIn/
         bk9ILqJBqsbzzIW0HB2aXyvyNicVMcZYmIhhBlvcDeR3Tnd2ADP5ssGpTtLjGYDhZUn1
         29cdZK3BxVkNTFO8ZxfdzX1y3kLf6dlq7xyoNPftnanFHytSFi4pMdjNxYKmQ3uq1prU
         yi7A==
X-Forwarded-Encrypted: i=1; AJvYcCUCx9s8XnW1ez1ot9D9fhMKAUCzNC+Zq41qhGlNlAqJ+P/sPARbXePMPypeAB9HzDFe/U+NbQdHN7r6dnOrmAXCQT+dFlku1wXPvw==
X-Gm-Message-State: AOJu0YwjXSq/2A4hNurTWsAON6JCZ1djhfTTp05I/zVU7amZEt3LVGPF
	oo2xFHEVms5BJUFQAVAElnLCwpmHVCHIOzSAlO8nPKbCxoyHTf2f5LcBtHi83Q0=
X-Google-Smtp-Source: AGHT+IEN14JC4aKAm6IoQEiJFrZ1mUtV2GIjZnWInAUAurGR00ImSNVfIpNW8YhhEhxbJzeTLcDKvw==
X-Received: by 2002:a05:600c:5114:b0:416:605b:584d with SMTP id o20-20020a05600c511400b00416605b584dmr7777987wms.3.1713185615753;
        Mon, 15 Apr 2024 05:53:35 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id bh11-20020a05600c3d0b00b004187e71bcd9sm681454wmb.30.2024.04.15.05.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:53:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:53:33 +0100
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
Subject: Re: [PATCH 08/18] backlight: l4f00242t03: Constify lcd_ops
Message-ID: <20240415125333.GH222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-8-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-8-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:06PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.

