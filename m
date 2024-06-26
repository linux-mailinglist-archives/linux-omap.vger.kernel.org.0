Return-Path: <linux-omap+bounces-1600-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBB99187E1
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 18:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D99751F22427
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 16:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A9818FC65;
	Wed, 26 Jun 2024 16:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kc3QfTfG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01E18F2C9;
	Wed, 26 Jun 2024 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719420554; cv=none; b=PPZtGQjOPtCaHWAF5xr/O+dO3p7xwEPR9+0867XgdDjYxpBwcq0vzByDr7zUi/MOTaKWHIWOocObV3dAxoxpEXtD0pNLpDP8Df+wtAjZvJbSY4t59xn5tz5vu1/b/jj4dIg443RXTdaIa90OXZe2a+QymMC81K+mjaaQoPbld1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719420554; c=relaxed/simple;
	bh=R/sU3LomlfmbktD1TecaWmSZrosmdGAXK829uqCJn18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOGrfA13gBR0Mtd4C1o87jtexkGmuWnZ4WgP001QluxBNg/nasyVGINWqv6Og1ZitS7lvz4nV1rRfyf0mqT3pr0305PgXNy5+QTlNQcGETWPV7iTNNmBy5AK7gp/nZsZY1gfBB9/9+qo8U29g+KhR6Y6cA4XLKjcizYm1Qq5nqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kc3QfTfG; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5ba33b08550so3270498eaf.2;
        Wed, 26 Jun 2024 09:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719420552; x=1720025352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/sU3LomlfmbktD1TecaWmSZrosmdGAXK829uqCJn18=;
        b=Kc3QfTfGBLYOqDp2HnkyCn13SdVtGtAB1bZIJ/76+1j+ofwsLo4nXpqdB2Iwo6DjgV
         qLhNVqr+WfSVNtOYb2jpDpbZNH0zFNNDn0EOwShTNHEUWdZ9w0GLcKkN3rj25jvMWU14
         ZUpY3DKw/GzfePex6qtt82Ru6f1WBdon8iY7h8dkKWgWe7KkSFbcoimx+j66VqhvuALf
         sNAePJ7dN270MDKFW8XAl7c6e9hL+/17n9ajFhLo2swvt0cjQ/VmfrNDzrHIMno+JtNa
         X/L+92Rbgb4a1HALT1eI6PBNd/Fl5gmuVJAmhX48V35lCGeY8q0d2ihTEgGlMd3SSftn
         QEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719420552; x=1720025352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/sU3LomlfmbktD1TecaWmSZrosmdGAXK829uqCJn18=;
        b=AIlgdVUfru+Wf0GRVAxF/bS9BBmStE3A6OiH9WfrGMpLSbgltZ2JxIQmLp1tLnIZzm
         +CU6ipqnLYluYTG/Dxa2+pkvmh0G7srJIJKfNjCgyLTJ3TQbmpZuJISd3+64IJdLX37Z
         eRzbGRM6aBZHHhb/uMHkYZJ4Pg2QwVZVEFypWMprBOhNNgzPUYSFvmUvIvoHurzqlVTw
         b+r16BkKiF19O210THZ05yOwQKlwCr9W17PdUT3U4v2CUyDNGJIikpSujl6zk5uFbHZL
         HSeWpJAUtGzh1tfonUrjdZbeuh0w8hgcQrvb/PWMm0/e46xdJ+YTUUOkRCv1UmupsIaX
         Cglg==
X-Forwarded-Encrypted: i=1; AJvYcCUtRo3QS2IWx9s/uVAfu44Lzvt6EeDkBUqjekRSzDdhW69VMUk7IVYz1x3Xu+kPKGzcj5VTzD4u6DG9PM60eziUNkP5h76bBq/O9hpGGKKnfIg1rRKYu9xIlk8kX+9o4PoPgp0Z/KxubiBDD/7Kb1Q+UlgPwzIP/WsWaAE/dN138Q1We08=
X-Gm-Message-State: AOJu0YxeZPNPeSE35LwZrmp2VccQn7KNALPTSI13P0NJFQUeN566HAj+
	0t5b5y6J/FYOCBo0MoRShNHM5tj1vxlAGu27gPaKZnhx9dS91A+WZ420/mk15jVFXsqzAfDFMTw
	TW5uqv4nAumClVDYSaN/PXFzghnY=
X-Google-Smtp-Source: AGHT+IEYzwhsc0CdVCOM20AmgWixKrtF0jZhSamyAdDQzQrcpEqM4F5/z5NPQizyuRgCamjyEDoVi8wHdRcXZOKRKkE=
X-Received: by 2002:a4a:ea36:0:b0:5c2:23ee:bc33 with SMTP id
 006d021491bc7-5c229fde83dmr1613387eaf.5.1719420552396; Wed, 26 Jun 2024
 09:49:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240615174904.39012-1-krzysztof.kozlowski@linaro.org> <dcd6afee-b17d-4633-af7a-4a5dbf68be94@linaro.org>
In-Reply-To: <dcd6afee-b17d-4633-af7a-4a5dbf68be94@linaro.org>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 26 Jun 2024 11:48:46 -0500
Message-ID: <CAOCHtYh8YucHNwV6+S-3vfHvygs=5_UGVwPt6R+i+qBTc3eOTA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: omap am5729-beagleboneai: drop unneeded ti,enable-id-detection
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Andrew F. Davis" <afd@ti.com>, 
	Roger Quadros <rogerq@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org, 
	linux-omap@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 6:34=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/06/2024 19:49, Krzysztof Kozlowski wrote:
> > There is a ti,enable-id-detection property in the Extcon Palmas
> > (extcon-palmas), but not in the Extcon USB GPIO binding and driver.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202406152004.F2fNnorG-lkp=
@intel.com/
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Tony,
>
> Do you still pick up patches for OMAP? Any comments on this?

Krzysztof,

It looks like Tony didn't send his final MAINTAINERS update:

https://lore.kernel.org/linux-arm-kernel/20240419055249.GE5156@atomide.com/=
T/

@Andrew F. Davis
and @Roger Quadros have you guys set up a git tree for omap patches?

Regards,

--
Robert Nelson
https://rcn-ee.com/

