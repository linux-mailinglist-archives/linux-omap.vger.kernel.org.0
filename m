Return-Path: <linux-omap+bounces-1527-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D490675B
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2024 10:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B9EEB24394
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2024 08:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7433140373;
	Thu, 13 Jun 2024 08:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cOQd9B7D"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBE913D881;
	Thu, 13 Jun 2024 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718268336; cv=none; b=o0vpzmU8htPeples0T6j+rQl1qPkYm7S7RXGDxQAkle8qy7NcCuz3RHj0fqbBog+fSGVWLu2TZmh7/XnQqrFbjP+sQ/PTf3io7DK/r6Plr9oOBOtAK+YiGwHF6vJ/Mc93j081CplDBbiCeUP7SEMO5Y9gkNa4GSo7a5o+H5dj1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718268336; c=relaxed/simple;
	bh=xYpnEqEWPUQlgQ8ob9kgiq9kJ3E0oTxBoQ5rflRhjyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJOsR5qkoArD1YJLTSkBIKraZ4gGa+tOHFJUt4uGS/xY9exFNhtdxDkDSlLU4F2flzOWC8Dev/drtpGA7/+b10WqPrsLjGMswoRnW0pj/w9RwGGT74bm/JOqxsC9DJDzLfUjSML321wIroNTjKoyjJpTZdAPIxMmyHiySTdBycM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cOQd9B7D; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebed33cbafso7852821fa.1;
        Thu, 13 Jun 2024 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718268333; x=1718873133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYpnEqEWPUQlgQ8ob9kgiq9kJ3E0oTxBoQ5rflRhjyE=;
        b=cOQd9B7Ds3ziKhooeKlSF4/GLK5w7JExvHZK4QT4xw4iaqqVprUFbn0loB2FJFDC0d
         X3dMOFPd4an25+q71EZBV0UtHTo9xk6Bx+DfGN43UmYPpVOWRj8oIQlhUh37wSD3k1bW
         CFGvmf+LZC5rSuF5dPH+Xot0BIrKxepQQfyoQfa7J1JmEzQQgJPw9u9mwEJTnF+k0Nw3
         cQzMI/HRXNPnDldxiYDUonNIm130NLkSfYtyjgpnJAWUWwM5LPSKS5cIhC6wXDFjHS7E
         dWtt8jRzZmhdmiWf350XqjBw8bbN1OrlCpcBe01RP1MHeMTtW6hKDB0Educ1J5txp3Vc
         KY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718268333; x=1718873133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYpnEqEWPUQlgQ8ob9kgiq9kJ3E0oTxBoQ5rflRhjyE=;
        b=iAcJ+t2bC8H1H3b9Fka9ZPgASYZ9ZEvXssm6Vd/SUA2H1t/kjWBCCyjkRsWmzlTA3m
         Xo/U5ImfOTvouRX1h2e8OQAdG1RwtpkSbP6fGsP2/uRYycqpRplaz3DCrv+/AbflzrZw
         c0c8wuKk8DZTRx8SvqIpnDnbHSOGa7eQEA7s58XOGnuZBN2sBzwWzbCAMAJUxGXs/yXK
         MqEyyu3LgfTaANp2o2Dd520hIu0AMO3J0mr0l5DYF+zLQDmPz1AZfC9xH48aLqPFRBuc
         tEPnxfopJFEUBipKnVex7EZRkkbgboeP6fxTUU9DerepIADi7O/PG4Z29cDE3d8Q4ISM
         h31g==
X-Forwarded-Encrypted: i=1; AJvYcCVihAJEoiwhG05IypGpCL88qOzzCIVS16YYZTuJRmgO8onM6z19OL3aTC4GuK0GEkClik3cP/UcmfOQsyVv1fDPD40mXg09D+F/PdV5S5GbMavK3Gbaa/M/2rKzOZxi2mmKf25C7UPZzLZKZ1qOZBI25ops60JHn5xQ/sOcI+XqKxcKGeE=
X-Gm-Message-State: AOJu0YwuAbr+/kF6/hWBJalLVqEqB9EfMUN17s+eqNU1WegnCG7gGC2y
	NaOJuaiakML+7jROFAOJvqDHzAGr5H+8Rz2ay/UXVzg9yzMz1Sn+dC/d4tPg4GbQeN+XHPQXCRz
	jbpnSejqmcF0H8kqYRNyURHELZ3g=
X-Google-Smtp-Source: AGHT+IHiQPdfmZveR8HVdHXIhXi5SfxJavyjvc/+pbQfBRC4qpJ6umlHZ/E5Nw2V2Qv/Sr4hR7uapyJy3qJCxR7Yp4Q=
X-Received: by 2002:a2e:8196:0:b0:2eb:e505:ebda with SMTP id
 38308e7fff4ca-2ebfc99f605mr26282071fa.42.1718268332651; Thu, 13 Jun 2024
 01:45:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611132134.31269-1-bavishimithil@gmail.com>
 <20240611164951.51754ffc@aktux> <CAGzNGRmoSawz7yHGzHS8PeQwRAsnnORLMPrrNBLupNdaOkUeHw@mail.gmail.com>
In-Reply-To: <CAGzNGRmoSawz7yHGzHS8PeQwRAsnnORLMPrrNBLupNdaOkUeHw@mail.gmail.com>
From: Mithil <bavishimithil@gmail.com>
Date: Thu, 13 Jun 2024 14:15:19 +0530
Message-ID: <CAGzNGRnnZWJP6CF1X6SXus2QCwUA763=qHUAy6c6Ny6_FFd7GQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
To: Andreas Kemnade <andreas@kemnade.info>
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 8:19=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
> I think the twl6030.dtsi and twl6032.dtsi should be as similar as possibl=
e.

Hey the values seem to be different for twl6030.dtsi,
omap4-epson-embt2ws.dts, and omap4-samsung-espresso-common.dtsi.
Should we just define the nodes in twl6032.dtsi and let them put
min/max volts and other properties in the board files?

--=20
Best Regards,
Mithil

