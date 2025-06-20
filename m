Return-Path: <linux-omap+bounces-3937-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF13AE1C41
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 15:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA31316A4B8
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 13:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F593282ED;
	Fri, 20 Jun 2025 13:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDQq8wTk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D994086A;
	Fri, 20 Jun 2025 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426270; cv=none; b=iqXq90m0o+yTSFY+gHdvALk+hvXtysdkjK3ikrYMLQJdzmS14DSemgL5HqIpMNI5XHyIbcvtZdqr2SL3Fs0KvkH9UjID11fD+vP3ghrqbeMuSeceH/fUlA7LWAAuvK3sSqHON6BEJiqpM/1DadTOuWUuv4Y73WkR0WtoSlL0vNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426270; c=relaxed/simple;
	bh=NHJhrXB6OOJw1NgU5mymcdv9hMgqTBO2fpNUTrhtfL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=unL2mJfYxKkNh0QWAACJIOgVQts2BD2Im5eF044gTVQ2E8i72jtfGQ6iobezo4RlqYJcPX8JIfvgwghyCiWuERetSCR7eLei9sU/ruEQrKKAKXEbv0ITuFhC/WZmJzG2u778pyw2FtuD1rEJGbf39jXf4nWf5lzX2mirfH59X68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDQq8wTk; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so1473603a91.0;
        Fri, 20 Jun 2025 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750426268; x=1751031068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSVJk3M3p74vqFTAAlpzPjLkZhZ1ij1cbOy0LDfjwl8=;
        b=mDQq8wTk+SicpnkAxJKVhEdpPgc/+40FRvinqjK3BxVoiDe9AGIfF9gBqjmrMh+i36
         ncZ0nKOB7NMa6BCVwBFRz3FPKydDyocuJ+ulEVUKxbCj9vxhn00qCjycENKDoGPcdbtc
         qlB9s1oRnOAabaITSDGONm1wvTKxPVaHPg6EQHiFpiWE6wFah/ASEXgfTPQGWTOquHrn
         BkPiFnugUMjFNYZfGs6ZTe1VFTvASQH8AYBLCahvEKQ4UKeG5VOY08w+XfD/QTzw43fL
         sVoszbBJphy+5w42U4y0Hh4kyGHFuNF4IyKI6o9MDBlAfzRdT4H2Br/NJQ6ZAY5HP4ID
         xFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750426268; x=1751031068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSVJk3M3p74vqFTAAlpzPjLkZhZ1ij1cbOy0LDfjwl8=;
        b=oU/mil7K4/hVoo93xa6HopZKxEQmIKPMOhm7yRWSw8MVWgt0MuoMGl0qtAT8gc9Py3
         tvIHfQLxATqDpe//JmzX4e1c1KbMi1dfmDk8s8NmjAPEoNutQlxGAPM3d3J2Z2bwoXm/
         5yNePsLbcLGXw+dXb1/FMlWwXM37o6KR0OHFf1wLvMvktmm3GK0hBE1BgR3eS85xhKp9
         Ap58uaGfTPMJGeKf0feYa9g3lm640rnnBu8mF9Qb0TXLJHEp5QxMTuuwTgkpIQxfJfyL
         gB/8vIZaG1jskDRZs48ZW8WEj66JljU7PsXoDO2R1i9badBQIQgSscrthYojITYNKR0J
         ys4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX3i7yV2l4YuBmBPAbJpcWNGeGRUl4zQVsh0DhM3JkP5DeHJzPEU3qqfAi9gfCAWt9W/krOtwcWRj4zUQ==@vger.kernel.org, AJvYcCXvO06EthizJHDFOnzTVBxx7PGVK7FaKIzIdSDNUICLGeNMwiq7W5BFxcGBIrTa2cpos5zAKfQqSfFuftU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC6Q2hI74DXomknJlBLL6wr4tDHEb366MTxoLJ0/nFl90AB4ng
	ikSA+2abERaBm1+WB790DPULbwXDQBsBnm/ewW5O6JMdpio1L+UOsqTbf91LTsw5AimAjzRKCJP
	+WldGiahf+ziihu78tJW8e2RGkrQ7xNtxfVyx
X-Gm-Gg: ASbGncsboXs3wDUHLmW0pMthBYkjH8uYT3r7Oteg3L0cIuPGpIhBz5MUpxAu+U7TrXA
	mZXGkG4ArM5Gv748wpEe10dCEIcJR0OKDh9clzVuBFM0MMZry8/0Yk+ywsh/xG/L2YnyN/ojf8d
	YLiToG9mH1+/PNHEkm9/vssVQxps/J2l3IZUCqM82Tye3C
X-Google-Smtp-Source: AGHT+IFs4RbzWCJt7R1NKN5zR2ZjAqi6cP5mF1/cPV5Fh+WgJJ9fRgY0uvVGrODJSJBqoXKypKKxrsPxHZ44CU8FGuM=
X-Received: by 2002:a17:90b:3850:b0:311:b5ac:6f7d with SMTP id
 98e67ed59e1d1-3159f46cf94mr3615235a91.6.1750426268102; Fri, 20 Jun 2025
 06:31:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620000924.2636542-1-s-ramamoorthy@ti.com>
In-Reply-To: <20250620000924.2636542-1-s-ramamoorthy@ti.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 20 Jun 2025 08:30:41 -0500
X-Gm-Features: AX0GCFtqggjuCFjLlKH5B6QhmXEMMAiDCgs8jNEzHS8qXl1UYUt3AF6T68Q4_IY
Message-ID: <CAOCHtYgweLhO4nNhNLtJ-_25guqER7ohDf7TNy8WNFwo898wPw@mail.gmail.com>
Subject: Re: [PATCH] regulator: tps65219: Fix devm_kmalloc size allocation
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, lee@kernel.org, d-gole@ti.com, 
	jkridner@gmail.com, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	m-leonard@ti.com, praneeth@ti.com, afd@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 7:09=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@ti=
.com> wrote:
>
> In probe(), devm_kmalloc uses pmic->common_irq_size to allocate an array =
of
> 2 bytes, but pmic->common_irq_size is being used like an array of structs=
.
> The param sent should've been pmic->common_irq_size * sizeof(*irq_data).
> This led to an issue with the kmalloc'd buffer being corrupted and EVM bo=
ot
> issues. The common and device-specific structs are now allocated one at a
> time within the loop.
>
> Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Regul=
ator IRQs")
> Reported-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

Thanks Shree!  Starting testing on PB2/BeaglePlay's..


> base-commit: 5c8013ae2e86ec36b07500ba4cacb14ab4d6f728
> prerequisite-patch-id: cd76c901948780de20e932cf620806959e2177b1
> prerequisite-patch-id: e847098a38d07e5ff31e8c80d86d9702d132fdad
> prerequisite-patch-id: e6a01f111e527c6da442f6756f8daa4e79d0fa3c

ps, worked around these 3 missing in v6.16-rc2, which git tree do you
have them staged?

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

