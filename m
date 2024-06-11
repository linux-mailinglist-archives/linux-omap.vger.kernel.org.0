Return-Path: <linux-omap+bounces-1519-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CE09043DE
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2024 20:43:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C24D1C24F30
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2024 18:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6986F2F0;
	Tue, 11 Jun 2024 18:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjDrUy5t"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED24A4644C;
	Tue, 11 Jun 2024 18:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718131413; cv=none; b=YNZHTWr4punb2RwUmbN1W5IPJJrivWqND3q96WF7z9qT2N84C1AxODcXQ8oNwdtrhQQD4b4dn5FbSS9sLA0SQ0Oglm/V65Zn3RcTa4ywK7N6tth81RIiCPgFgcGSkOJfX81asbYISmA0u87vt/FaYj8RKwknXAfG0bxbh24ADKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718131413; c=relaxed/simple;
	bh=HMyc4bT6r/w2n7Js+X6N54BUQhZ/E9ivt4CcJuMZ9qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJQZMqRkmuQ5PQzzNNQdAlv4bYwpB5En7Fy4eF5iQkujqNFsKZB9hPcJZFClfAXs0I70Ar0yiEpXYHY9w1X/pi0EZwf46klS6Zsj2049xd2N/sB4HP6gadOrwbBXKakfXv+h9DGIQ6d/f5HIzWiW/QMiOq+O7btjNDpN5b+hN4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjDrUy5t; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebeefb9a6eso14739731fa.1;
        Tue, 11 Jun 2024 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718131410; x=1718736210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMyc4bT6r/w2n7Js+X6N54BUQhZ/E9ivt4CcJuMZ9qs=;
        b=QjDrUy5tVwBRkmvOXv+IC1Zv3EROLz3PbbToIk2Twud34vLPRaqrwGagMjByBc7/e6
         8k2nFatesYHaMDRJS50PYresPzzNB6qyxw5I7faerv1x6skQ2JKWbGSMD89uVnVTOCTx
         QYubWa7pg3nI8LpLsVV8dwZT3UzRDdpiuoWqbbrKzCK/bj92htSIPFm+O7lOJWeCd+4b
         +LH1E1bZr0NH+q6LmFtJoaAq2SbQBWVLMZCk98Y+hu5TF4SnHSHia5gFGW9iEhDc3xCJ
         GDQL4Ia2/sddI6yUbvRgEgDIGrjIlmpeKmu5RAAyIexTZ+cx2heuuwfpciv3npOI9Cye
         W1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718131410; x=1718736210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMyc4bT6r/w2n7Js+X6N54BUQhZ/E9ivt4CcJuMZ9qs=;
        b=FE67VUkNAxD9QNsjyA8qL17SVVxqef6IizyOIYByF3lF+B1YT+qV3uNJAhVZpXsmvu
         eH0RupYgAXNuOnIUkDA1EYZ2a29n4cZbi8v9FJqVc51xVBit/na4vb8AdBFYKO44200b
         pkrMQ1sYTE+rnkBpFQ7cMp0c9G/uIP17Bjizhvp+hQTofQHQiCUuCFBalf4H2evB+B5y
         BqTGBWZ39jvtBe514aLBM5y73fZ5tj3TJRfckq84mhOQyxUofPTtMZtJzRCKkp7RS/k6
         93LUAOUFiLeumSm8+88hP/uu3rzLh4nz1wrnKJ8qWsEpvQtcASLfWWwtOHxBjf1pKJ7k
         p8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwDBKQ6rmzrjlhoLfsGjrqvIOs41av5fsc0WnrufkCqewc2JJQpgBXgefZ8VV//pCJjVPgdYJL43stg/eGCVRpzXFbpb85mrJq96GNQ0vV/58YJVW+7tdpPTX4UlAWGnGYxU+k1ZyvXd6YsNy5ARQh1tauYwpFu8K+jqdIf0NPCSHDT0M=
X-Gm-Message-State: AOJu0Yyrj4irLytVGmCtgTxVHIGRYLcQBZ+ceKnwZRUfO2iJuP6oE2l4
	J0oHx7kFut1TaNq79tW+3RlFwWMdINNjAn/5WaQBejvg6GUXH2A5xd79rBonpmxV7mQhUY72K0X
	6jAELrMTXbQ1QLSDqj73ud1HsiGo=
X-Google-Smtp-Source: AGHT+IFR0HuBjjtBpGUGnC1n8m5LaRH75CZMOZaWTsBvsZhf+ocdgG8M7BZDoCW1o62xIr7F/2JeXPylHz+px3w6XMw=
X-Received: by 2002:a2e:7d11:0:b0:2ea:9300:e136 with SMTP id
 38308e7fff4ca-2eadce7a513mr76072841fa.42.1718131409773; Tue, 11 Jun 2024
 11:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611132134.31269-1-bavishimithil@gmail.com> <20240611164951.51754ffc@aktux>
In-Reply-To: <20240611164951.51754ffc@aktux>
From: Mithil <bavishimithil@gmail.com>
Date: Wed, 12 Jun 2024 00:13:16 +0530
Message-ID: <CAGzNGRmoSawz7yHGzHS8PeQwRAsnnORLMPrrNBLupNdaOkUeHw@mail.gmail.com>
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
> hmm, that might be board specific stuff, maybe keep them as they are in t=
he
> twl6030.dtsi and override them in board specific dts files if needed.
We could do that, since we have no datasheet publicly available for
6032, I thought it would be better to stick to values which are known
to be working hence using downstream values. Anything mentioned in the
BT200 kernel, we could update it with those values.

> And is there any reason why you left out the pwm stuff?
Didn't need it for espresso, but will add in v2.

> I think the twl6030.dtsi and twl6032.dtsi should be as similar as possibl=
e.
Agreed. But same min/max values as well?

--=20
Best Regards,
Mithil

