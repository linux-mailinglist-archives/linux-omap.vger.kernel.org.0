Return-Path: <linux-omap+bounces-1566-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8506E910575
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 15:10:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F917287FCE
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 13:10:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD10A1AE0AA;
	Thu, 20 Jun 2024 13:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzEhankm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05F91ACE73;
	Thu, 20 Jun 2024 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888734; cv=none; b=sRmn86r8vT2PF9o2JVUCD9wlCGXdD5YAthPuDvGUM6V1Tv6oKHxyHC8hSQunUtmqHThYcV2zBOr+dmW/85rl4qMk7JHo9UBESt+yKY2ogjp7web21M/Oit8nsaAp6ed7Ho/9J7gqt+pKlSC2p0eVu1+rwZlgm2uf413KZJLTAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888734; c=relaxed/simple;
	bh=CW67Odk2NxNyxJ4qAmclOWnaii9SeIs9/lx3f071QpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gOsNapn94IvR8RkxHRCKDLB1e9Pwt3MLb8zXug429Uxw8ajQ6nhPdscM3J+cpb8efFuw9g1nfs89yaaqUtww6Iv35ZQeuPNzgVSIR8gNIaxVSHY5qW+u+t00DX+cltE39xmucHdDuWsZL97STmR4ofaIkYvz10sNH6U4Ew1rVrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzEhankm; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso883144e87.0;
        Thu, 20 Jun 2024 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718888731; x=1719493531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4gb+FfeqRWMVLQI7Jm/m9Je3kgzXobOl5Gw0fKArWds=;
        b=XzEhankm+B++zX8JYSW2onhe4I6NjZQKaCNxq1UVfghOzU5dG2Dy371jE+v1DfQNFb
         TLkeYkquoeIsaCBQ+xoRpCU5uHeTeQgrCfSsPJs763v9v/JVYaLhB9Hru/OJ6+l/pg00
         UVm3KO/MqeRb5E4th40Sr09wlgxJl9C+NzxdD/MQCCl+flhR00TahwM4am6ApnKZIkkA
         b2CpbqSG1lgOOrg9hNI/3EXnG5kMut2C/xlogPJOuNxuj2dQY06fA/7iJ/kUPp13b+MW
         3N6HYjTEobc24ofaaEC1xi5R5VYIe2Rl4Y0Fzpvtw8eNxHhe7tTrGK3Ctxprbc8aVdM+
         UJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718888731; x=1719493531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gb+FfeqRWMVLQI7Jm/m9Je3kgzXobOl5Gw0fKArWds=;
        b=mLumgY9AXhgV0hccMC8XGCQhRuDtBIUEyZPf1F9oJCJirMp6p3S85vX00EE9o5scYl
         Wzf0yEhLs1j0gxLrTjBXRvdcwNAZJC/x1an1KAlurETjqzGCooKStSwUGrQao6PIK+3/
         diBMW9dDiMMsdR91UaW0jgRtaFlv3FV0rfG2Q6Xqw+UMzRyXyhevnxpB0JgBiW1ZUF+p
         wkCY03UWZreWznnfj9vGg0GQgWoB4NgEqcQ5PkNyeRFDs9sRW3+mkgnI+y9y1k+08X1a
         QLlMK1lw6Bo8d0lFAdiDqZG9w3DfPeV3i2SQM7xs6ZOcQ98GpIfYL29uxtgBe41+szJx
         3tow==
X-Forwarded-Encrypted: i=1; AJvYcCVcsBHAymRvWNRAlq9T80/Ik8e5fpWam/yuZBkfAVJjdLU2nyChdjjfdS9k5Bc5kXFO5p+Lw2TjMVvFSaGpzh9sQmLriwtuftzBO6jxfnq4g1SArPu6bQOn2bS/QY1t6E8Av3ONbrQE6lPRNC2/uK09jP7Ws4Ha+NLVWmOhknZ1ptmA/Vw=
X-Gm-Message-State: AOJu0YxGr1iyfOkoLLC0wZVhRjTtReWjyXGvtuG9BsDctYUFa1dK23Ai
	WLzVoTLT95Z70GrPB8i88owdZXoQt3C0BRpMIIuP/y9CnKHnuS+B1RXSpF6+Em8W4OiEh/RZbYh
	ADf+u1MfptbHHGlkRXurYOlUI0lA=
X-Google-Smtp-Source: AGHT+IFduh5eLCvTJMpJK3rEGrdpp83bWcNoB0yrWk7/vzPFsnPNLOCACN0J0Nj/s5pdi/SGQz/m2OcOqytXmSu/guw=
X-Received: by 2002:a05:6512:48ce:b0:52c:8420:59b with SMTP id
 2adb3069b0e04-52ccaa54e7dmr3301811e87.49.1718888730609; Thu, 20 Jun 2024
 06:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611132134.31269-1-bavishimithil@gmail.com>
 <20240611164951.51754ffc@aktux> <CAGzNGRmoSawz7yHGzHS8PeQwRAsnnORLMPrrNBLupNdaOkUeHw@mail.gmail.com>
 <CAGzNGRnnZWJP6CF1X6SXus2QCwUA763=qHUAy6c6Ny6_FFd7GQ@mail.gmail.com> <CAGzNGRk3dwGEsQbrN4LZfKwDGTncHpKEcf2cLepUkRYBO4yn5Q@mail.gmail.com>
In-Reply-To: <CAGzNGRk3dwGEsQbrN4LZfKwDGTncHpKEcf2cLepUkRYBO4yn5Q@mail.gmail.com>
From: Mithil <bavishimithil@gmail.com>
Date: Thu, 20 Jun 2024 18:35:18 +0530
Message-ID: <CAGzNGRmMqFm55r3FdhKHuYej1pENfaO0az6sb2_1P6+r65M-yQ@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
To: Andreas Kemnade <andreas@kemnade.info>
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello, how should we go ahead with this?
-- 
Best Regards,
Mithil

