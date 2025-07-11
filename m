Return-Path: <linux-omap+bounces-4090-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13498B02311
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jul 2025 19:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBF7F5C5573
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jul 2025 17:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5718155C97;
	Fri, 11 Jul 2025 17:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DsAOHhhN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A431219A91
	for <linux-omap@vger.kernel.org>; Fri, 11 Jul 2025 17:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752255932; cv=none; b=Ix8pfnLrGg2oVULLxsmQW61XKwt0zqqoUI4C+flKSRJjjmmF6Y3XJPboL9EiXJqdOaDs82g7okCjswJzhVaL1LPQB1UMHxyt0Q99dX9xVFqfTDVwXyf8g6Xio4wyLV7m9z2CPGI0UdbrNg93iUDNKoWOBBuyuxyMYTMy0Ji9G3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752255932; c=relaxed/simple;
	bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByOcvXyzeCYbkBEwXnHB2d0l6KwT0NIw3lQWE/A1US3i88I+9vTlQ0GOS/c3ofwQ602exbsxTLTBP4pQ5Gg4Ztmz73axYqM/rXWOHgAnm6dGSlmc+JYc7hmRe2HmyCRvgHlx6NL0QyeY91AQms+lrkuQ3niJjYinMYAVUlxDxh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DsAOHhhN; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso2706670e87.0
        for <linux-omap@vger.kernel.org>; Fri, 11 Jul 2025 10:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255927; x=1752860727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=;
        b=DsAOHhhNfQWrOBSodqloZZkx+mrGk42CQf1xlp4MCnECgkYK/bzxIWTsy1ZoqqRJAd
         4d5vdX1r5W6NkUrDoHlXlvHhi8jfwjzikBLRB8PrA1w6yNdU3yQYktvWe+hAcJ5yOc7e
         Oqei/L5WS4binn/957lvfGqiXlxj5gcJ1rHUEcL7UPQ5XgqfcTAO5dqiwFGpweopO8oW
         3r1UTY4kV7vwGqhZkw9BqMgBn0Kn3raaNvLT2xY5n6kM+Q6k6KGqdrJcEbtDMwdC8dbi
         j6us6x0LP7vM6nIDXKLtpFLAQSdN9Jy5pFNsR/ULb8lZxkL5+rLQRyXOLcnj1UdGfhW2
         kRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255927; x=1752860727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mb/k9Ts4NFFqDMDgg//vbq5zdcUl72jlNOg9BWpwo5Y=;
        b=la92DEWecbn20tj5VmSPOVwo3NsbQkdb8/EBiEQHm6BHDxgJns+48QvXyctq2xfTHE
         W8lq70fF15bDrtwk8B7LhbkdAy1u0LMuJ6zgUmF4WsbxTH0meSjJkIPNRtJtvzy3iSVC
         sFL134HUx9Vw05h6mmZyoPzww63MLmEnh+rsEi+6D/JtM4fYIcv7PXlCiq3mP7FEbxFS
         sm5LqCr5brSAx4QEGmSeH7OTJ6l7wXLIXVuaiAEgo2KUxmwN+ZZ8tBSo6RvuUOwynOZM
         xnXAp5dksNrzkwQdEvOEF2Gl2OfyViz0bt8yP+BO9rUMZqG3RXdQs1JjJVcHzrNnN6+z
         PdNg==
X-Forwarded-Encrypted: i=1; AJvYcCUOP3oi6i9MsVMGJK7Q8lmcmQt64SpsIWKQAOJWyfPoT/Xzf1tvJeXZ7PPEb0B7AIgYJT76+vgV1Lsj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9SFA9gXxlYQ3qVaLgdUZXDxGh+mYpeRDKSYv0H6aw4PRY64j3
	9wS/uXlC5ZOKztEFhcMSwsUR81xHzEf2/lUM0dk+YE32pvRgvmDNhPUumiTwV5fDg5Twrr/DA4N
	OX9R4i2dca1lGTwPYqKc4ibQaXe/Ura/zhHQbno/ACg==
X-Gm-Gg: ASbGncshYFKVoSpfnnLgyF1jHNUTZs+x10DH6//xCC+wA18sb1eKPS2N2+LQ87aP9pr
	KUyOA6hgHUydOXz5FSkHEypMBsUHIhsFv14BjqTTmhrIlrSHO4LGRkBjITOHIFLuxsY75R/1NID
	klUJnuYpzvPYMOCfHfpTcZv1aeFQj8YEZXi3AfYkC+IfmjXxxOfWAi0UC4JFc/AZeuLTHvbkWKw
	F1xjEAQBIpwQ5kXZQ==
X-Google-Smtp-Source: AGHT+IFZDCZTlE6gWaEB19mO+GckYjvcVz7Jadiih65ETG/CCRys4RjtiQYLjKpiBNN+Zotnz3hQQ0D3S79xjWv4t0M=
X-Received: by 2002:a05:6512:32d1:b0:553:24b7:2f6f with SMTP id
 2adb3069b0e04-55a0464f653mr1135322e87.51.1752255927288; Fri, 11 Jul 2025
 10:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com> <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:45:16 +0200
X-Gm-Features: Ac12FXxij1ZPhhWO-gI9e94mzHRwj1K4FxFxtD7flD8pQuiwVzPSrPB2LvZpGlg
Message-ID: <CACRpkdbpXPXFgRTyAG2MeZvDp7wj32yQO6eRRMp4rQ3sCbQ+Sg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: versatile: clock: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 1:42=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

