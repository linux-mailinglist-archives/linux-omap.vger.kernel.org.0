Return-Path: <linux-omap+bounces-2557-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E3D9B9330
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2024 15:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D93282EA3
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2024 14:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B810A1A4F22;
	Fri,  1 Nov 2024 14:29:29 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992BE168DA
	for <linux-omap@vger.kernel.org>; Fri,  1 Nov 2024 14:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471369; cv=none; b=s9S1c1Ju32XO2PrA/hDic7CZAqx5575QsfQfddD6v8MECiuif5IvIRGGIzjRscL4ASaS9iykqZY6rXYX7RftOBrPJXFDl+F6/Ef6OPfEo/koSvqj+mRHeuGHojG4cVx+FDJYfW2JzfxiV2qNKsZAgOFa9aO7n6GRTaya4S7CaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471369; c=relaxed/simple;
	bh=VmHz5nlZIWqqvEKJFo1Nsn0vzxPDgXYMjLtwHruwULw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZA9kqN0DeYwt7mxCkyCHxWRSsv8eigoMFuaJ+VZaMC6jAcrsrBYHFVdK3jcs3jaqmQo2CZV3Sf6NDllTSTbygUrQrIh1Ru7+ufBJ95WL6SzjRrXE9akWJo85DwtwzT0lfw0aKFrcwHe/0xcztcvjR7Knj1qpjwIVXc1NAJ+SBWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20cdbe608b3so22260175ad.1
        for <linux-omap@vger.kernel.org>; Fri, 01 Nov 2024 07:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471367; x=1731076167;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ERLYvyPbKZ8JxkIbrL8+Ki3TJhm1EhtXm+s7krpp5vc=;
        b=KAsUN/vEpRgNNcEkSENgm9bU3GuhTZBlEcrGM/ylO46toutb2MMhNQfb2ccecBsB2L
         /fsmlWSQGIaJFCXV9WzjogF3smkA2Ynm+OdjkdmK4fboCVl4CBKgxUPlbb0VIxnnuS3o
         OEhTzS+zSRGDUUL1HMwTDITqtmqCZmOqTDGFbbxPTTDf6HlZ3VopR/nDZPC7yJGk0lF8
         rnUrcGqnzif3os13I1y974fvYr8+IFkZsCxltLdJiPhwgnRtqjw2WueeztlV67bqvt5w
         quIebzMOjaYgB2Kqz5B7C+14uGXRhkBxf3weLMp/nVyyVGIH65usPbjxc8jhHZhqCqBf
         gYUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgW+DpVS9aQOSBKfy7jImSUu8P4C8uLHIGRGI3glpb66ZF64FZTMCeNmHpWJDXHDURcArh3Niix68R@vger.kernel.org
X-Gm-Message-State: AOJu0YwLTGu4LMRaIqqaDxqkSl6OkmmSY1WU3dAjz9mfZKbEOxzMmS/H
	8Ivfe9ROCeNobTOwxmTUImYndn455txb3FiMnffQjgoan8P8BrTUbIP9rFvehDA=
X-Google-Smtp-Source: AGHT+IEjuPaRXDmIHKxmEM1MgXCWCoRlSILQEUVyaX7oKcUJxOvSkElErAbt27tTtHIX1LTt/c1JlQ==
X-Received: by 2002:a17:902:ce10:b0:20c:a97d:cc5c with SMTP id d9443c01a7336-210f74f6256mr147030695ad.6.1730471366846;
        Fri, 01 Nov 2024 07:29:26 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056eeaa9sm22092685ad.47.2024.11.01.07.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:29:26 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Judith Mendez <jm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bin Liu <b-liu@ti.com>, Judith Mendez
 <jm@ti.com>
Subject: Re: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq
 calls
In-Reply-To: <20241031145652.342696-1-jm@ti.com>
References: <20241031145652.342696-1-jm@ti.com>
Date: Fri, 01 Nov 2024 07:29:25 -0700
Message-ID: <7h5xp7owmy.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Judith,

Judith Mendez <jm@ti.com> writes:

> From: Bin Liu <b-liu@ti.com>
>
> Add omap_gpio_disable_irq and omap_gpio_enable_irq
> calls in gpio-omap.
>
> Currently, kernel cannot disable gpio interrupts in
> case of a irq storm, so add omap_gpio_disable/enable_irq
> so that interrupts can be disabled/enabled.
>
> Signed-off-by: Bin Liu <b-liu@ti.com>
> [Judith: Add commit message]
> Signed-off-by: Judith Mendez <jm@ti.com>

Thanks for this patch.  Can you give a bit more context on the
problem(s) this solves and on which SoCs/platforms it was
developed/validated?

Thanks,

Kevin

