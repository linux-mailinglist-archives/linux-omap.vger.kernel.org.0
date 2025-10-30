Return-Path: <linux-omap+bounces-4813-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C130DC1E65E
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 06:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 621163B45AF
	for <lists+linux-omap@lfdr.de>; Thu, 30 Oct 2025 05:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24FF132863E;
	Thu, 30 Oct 2025 05:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGFn7QQS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6EE30CD8D
	for <linux-omap@vger.kernel.org>; Thu, 30 Oct 2025 05:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761801257; cv=none; b=NR0CRmCXCpyh5O5BpCIAV7rwxaEyckkEFORz4n0YMOupmYXW6EtX20+Cdxd8VnYkW2DhbJBKHNvXEySIEw7sZYY/F35+x29N437Kl+B0QZBSaNPfDEV8UylB7IBo+Bf8jKKYjVUckPIcFtQ9eDTNIGwhPv64XQJmSaDjPCw58/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761801257; c=relaxed/simple;
	bh=T9QHSB+KZkLl9uHgRXc5ETf3HFmGTKOuyoZXK7i7tR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSonxRJy6sGRNrSoB0+42oefAvq5Q4+V+P8d7PkTcEvfc3GdZQlVX1DMwPmK5XXjkTnyyRsP48iKRKKzRGraUbgtm66prWXDQhVdPh44PSr/7F+Ck3aoalPOjQylQNPhrFUkvX9hH/vNTuwxDI+jHIlwubxjSzetKDcaMzm7Sjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGFn7QQS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so1083045a12.3
        for <linux-omap@vger.kernel.org>; Wed, 29 Oct 2025 22:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761801254; x=1762406054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tq0yxGv6yRvwde5HLaH1HkY7PXCLMaOxQayqcCSGMU=;
        b=eGFn7QQSkw44XxcgW/Ly0VCFciycqennQ+atdW4fBXjZ1cZ9cdRDeY7Oz/Gn4gp8v3
         /vRAqqxqyiNmzyjDhwAkW4C92sd7ykz/+f32KhZipOM3HATm2jUIFj7ejVYnkmDvmc80
         l+A4Af+xRkIFg8nAFh46Ql1ZwWvmU++Szxnioa6fChxC5UvsonCd5+45dVuE3lwpNFFs
         goW3UrOAKf1Zrv/21FjXX4QWMuOsYe9PK1lGzb3B1NVo0yXklwkg/Q1wTHSjMEDKAUcn
         L/jqp7Gy0/aKe3GBuoTpDYPs5zOo8ZIUqOQdTXy6eXSbuA22XmgqG3Z4paE5Upg95KHT
         3x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761801254; x=1762406054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tq0yxGv6yRvwde5HLaH1HkY7PXCLMaOxQayqcCSGMU=;
        b=MPyhR5vETgtWSqlQwwilqGHUeBACsL2ldaFdhy+iRc+YUqmA2UNlvF0a0J/UKzo0GY
         N7WDRtABg/rn3jbWXsLvHOZsN5c41rQfhI8QCMGO4gKjIzOWWszJYokp2WFVZq190qE/
         X4z/Z5EBPBtxZZDYqrT9ihrDE8e4+osHCnW/LTPd/MHy2CsiezTu0P3744bhxvYLP9yN
         oTpIskF4TKyQKY7GpqJ7bbj+TG+MJjkJYShSIOMWgmpN++JgowWCISLvZETVDL7G14Ra
         Kv3qoZiNUKaaBpKu6X5gul1paqdwuc7aWNcnM/A5TAgAztv3PPXXmGxwlVKvBZWz0wI8
         wTTQ==
X-Gm-Message-State: AOJu0Yygiah155zrTKyTv2FigwJeimPHwmTkPZRACGI21UG2F/v9Vveu
	CPCNY2EwGrijh4jPJvSuZY3rpeHhUa87kjm4DrMazIYSQHgGuhtm70RLpbi94Lcq26R3cIw8k/E
	27Dyxjq31b+Ll+8MgxolSt87ABJko9FI=
X-Gm-Gg: ASbGncurZbsGrLYvdDtR5QULtir0CzQ7PpYiW/iFvXx9nKq3NlzwHy/r88ftpYF9+1+
	LmEb3Yi95hCo5H+w0jMWgktAtUJgelig7+0ElHIItzzGBe9enJqiSXDn+cn3uALzUYDbSdXHh+5
	NT6ZlPktG0YA0WlaTOq7uVSTcIKNACf+xBGeXZ1uSrc2bqcdz4m5z78NG6I+Yy8SI/WJumDbLBB
	LzoKZLfqv9kQHI1ESjP9Ykg8BA6HfigBiHGV458aFwseQTGlv+6GXWKWI0=
X-Google-Smtp-Source: AGHT+IFDCMfSXrIL3bjIKZw2IhpHFG1U5RsQXDbZl1lPFfpuAvA594DxUOaln1JvXCqNQSfMK0dolS63NIEWPJif8rE=
X-Received: by 2002:a05:6402:50c8:b0:63b:f3a9:f5f1 with SMTP id
 4fb4d7f45d1cf-640441c2092mr4444447a12.14.1761801254315; Wed, 29 Oct 2025
 22:14:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028154229.6774-1-linux.amoon@gmail.com> <24319a9a-ccf8-48a9-8b5d-3a846976afcd@web.de>
In-Reply-To: <24319a9a-ccf8-48a9-8b5d-3a846976afcd@web.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 30 Oct 2025 10:43:56 +0530
X-Gm-Features: AWmQ_bl9cBL27Bidm95xNfiwXFieCJ3byhHw0tTbL2X_4Wmj8VImOI2xhqIIeMc
Message-ID: <CANAwSgTO2s8LA=e5CVYnpJ95_DLdkiot5Zbz1hFaejV=kTK2_w@mail.gmail.com>
Subject: Re: [PATCH v? 0/2] PCI: j721e: A couple of cleanups
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,


On Wed, 29 Oct 2025 at 01:21, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> =E2=80=A6> Changes
> > v4  : Improve the commit message.
>
> Would an other version number be more appropriate for the subject prefixe=
s
> of this patch series?
>
Yes, if there are some more review comments on these patches,
Or they get lost in emails.
>
> =E2=80=A6> v1:
> =E2=80=A6>    dropped unsesary clk_disable_unprepare as its handle by
> =E2=80=A6
>
>              unnecessary?
>
> Regards,
> Markus
>
Thanks
-Anand

