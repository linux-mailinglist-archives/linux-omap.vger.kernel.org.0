Return-Path: <linux-omap+bounces-4534-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E8B43F6C
	for <lists+linux-omap@lfdr.de>; Thu,  4 Sep 2025 16:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47FDDB61392
	for <lists+linux-omap@lfdr.de>; Thu,  4 Sep 2025 14:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D10307AC6;
	Thu,  4 Sep 2025 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajBr+Xfm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836311F4174;
	Thu,  4 Sep 2025 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756997039; cv=none; b=jio1Ay2/WkwQtK95Y+xODdAV5KZ8OHJJAQ9m7K3jPC+bixt59dekXD+bXoyP1cR1CfUl/uSpMi5fsdwAms2LMccTorDE9zrVYhgkGfRKMfzENBnpL0XlTC1UkFJDRWff8f4o69kcyEIQSv9dvYD8bqKebGs9J10c9BaMiZz3F/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756997039; c=relaxed/simple;
	bh=uTnI1fSb+0O/dtZS9vd5suR4yxBZH69XXAYT/NdOd8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i01EOn0U5O/vt8UAW0HF2rmnDna8E0Khcff/bsouK1tJ3ET2ZAYwMdHS8wnaZ8a+igAsD1faVPxl9eD62pdOmV8bImEgN3jnkLRQKG6mb/9dxHUD56+9lMgttafhgbBpr0FzwrVmQeNAkgbu5o5PJmQX8pmBkALYNsdSUIzTMzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajBr+Xfm; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b4f8bf49aeaso921274a12.1;
        Thu, 04 Sep 2025 07:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756997037; x=1757601837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFf7Yyea9LHiZle0Vu0g/QEXsC9kvW/M7vSP9n9xiK4=;
        b=ajBr+Xfmfx7Nb3WIIbcbIox3LITLVAJreWPBfUFBVFBURiKgw4APSUWtst+jKhdoj1
         1+r7G0CDEbeaK+ySYfATAGELHEWb1T3JNfN9P200UqCtG9vzGxVyAyPxdcgfpdYVoYIH
         b72sIrXjHp6x96qVTcvLtaW0bbvQ1EY492LxjTvfuT0J75ahX6VESHJW3b4oMEVGIhii
         BZiNGqEUQhVj1if+rZLhUzqWUcunZugSDZgyxwVaZnEFn5BSJJiyjV+QGwf4XATOe0/q
         BQ9oQOcqtWuHv92XzAKBaz4sTUN8B9tOm4dsS02fADQAt6eBrhKQIS5eiDp/gzSO3G/H
         Kg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756997037; x=1757601837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFf7Yyea9LHiZle0Vu0g/QEXsC9kvW/M7vSP9n9xiK4=;
        b=BQ+8GvGJT4x/+gwa8EUvzrPpGarsNX/MPcDmboZtb0RcCwZUFJ0x3+zjT223PfxjZz
         EqjaCJJryx9ZgSI1q18ARNEX65MLQpdY4ELRQ7U/aGOPJcF3ZMcP/hdP2RQ4oVnqTmH7
         So1T1MrHp/KUUYmxWwpHom9EHRtXR9J95pbWHh2hbF/UghgAz7nv/Nll3jzAkhhXDWVS
         RMN99tmA6kRtcJONbeTsGsmA/iE1g1ZjDJA0tPdeCze+MeuDHXmItnpElxGJkSR5TUsS
         ZpgDPtzJtjI461gOi8B8qksP/wH9DhA8HkX2LEP87LJrRd0D+pZmCZTBgkyPgYuscTDZ
         hvCA==
X-Forwarded-Encrypted: i=1; AJvYcCUCru2yn7hDZUtcOIVxOrLOKieCzZtlQMcMFthIXgMH1lSTIl8xGbVKo0f2jDC4aFBGLICp2AdpqhxdnQ==@vger.kernel.org, AJvYcCVBdViW4ml6qqCYy0XUMMeLDBQGDkaZFO7296hlamzGAsvhh3FLka4hjpWKvlfMYbGSpoyZECJEu0CTFaCU@vger.kernel.org, AJvYcCVNaIdAVuCRcFNtKpzSby2x/rUIEtc/JgtVZsPCX4gDWXyQbCeWuvyPhqjSk8xIFWUwUxfczH2XAaE/@vger.kernel.org
X-Gm-Message-State: AOJu0YxYUvnsZIAollKBinczp/meJdwh0m8feM0HIudEwUiuY12eGzWX
	uDQgz/0bKaoUi3wC5woALF/f5J3v8hfR8IpsQSR4gZr+HlznglXftqnqSwC+xKg6ezMA/nBbCoN
	idiJwkh7+HHv76fMlN83exFGWS1g6cQ==
X-Gm-Gg: ASbGncuy6fmc42IfNpAAOZUH4lXZ/EYZgPkcy6T1yi/4Re7pi4i99jDbNEtZcXGlt1P
	0G4yASKUtVDy1ogEGpSqYgBcU4dGJx+5Ez2vhyiH916DGs9ZvthXytpZWu8AjrYqToG9s4kR55B
	kc9YK0yuh9mW5f5aUxDX8yiKCavg2JqMiw9/I/j1ZzGIzvApmEnFfH2u57cmuUiHKscNGT7Zea9
	epOamDYt2jljIDoe6G1QQ==
X-Google-Smtp-Source: AGHT+IHsY0zXA6zUaKZwMLESPvBcSYKBHt69QEuQOrXgFcfm0SeYjpDQnakpdZCaDqwyXd1TBq2aYmhF9+AYJK+f2Vo=
X-Received: by 2002:a17:90b:55c8:b0:327:dc81:b3a9 with SMTP id
 98e67ed59e1d1-32815437a2amr27682469a91.10.1756997036687; Thu, 04 Sep 2025
 07:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250829052233.26821-1-alexander.stein@mailbox.org>
In-Reply-To: <20250829052233.26821-1-alexander.stein@mailbox.org>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Thu, 4 Sep 2025 16:43:45 +0200
X-Gm-Features: Ac12FXwCjwRMKGmkZskxGm2oHmUORnzURuKHggP-ddD4-5C41v9LtzsaKROlKUI
Message-ID: <CANBuOYpC4OMFx4pMe3-0i+cR8TqOALxb62taJbL=MSBpYxmHmQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ARM: dts: ti: omap: am335x-baltos: Fix TPS property
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 29, 2025 at 7:23=E2=80=AFAM Alexander Stein
<alexander.stein@mailbox.org> wrote:
>
> ti,en-ck32k-xtal is a boolean value. So remove the value and keep the
> property by itself. Fixes the dtbs_check warning:
>   ti/omap/am335x-netcom-plus-2xx.dtb: tps@2d (ti,tps65910):
>     ti,en-ck32k-xtal: 1 is not of type 'boolean'
>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
>  arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi b/arch/arm/boot=
/dts/ti/omap/am335x-baltos.dtsi
> index ae2e8dffbe04..ea47f9960c35 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
> @@ -269,7 +269,7 @@ &tps {
>         vcc7-supply =3D <&vbat>;
>         vccio-supply =3D <&vbat>;
>
> -       ti,en-ck32k-xtal =3D <1>;
> +       ti,en-ck32k-xtal;
>
>         regulators {
>                 vrtc_reg: regulator@0 {
> --
> 2.51.0
>
>

Hi Alexander,

I believe I submitted a patch with the same fix a few days earlier,
Link: https://lore.kernel.org/all/20250822222530.113520-1-jihed.chaibi.dev@=
gmail.com/

best regards,

