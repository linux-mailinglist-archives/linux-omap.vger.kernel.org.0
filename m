Return-Path: <linux-omap+bounces-4649-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D1BAF32A
	for <lists+linux-omap@lfdr.de>; Wed, 01 Oct 2025 08:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D56B74A5575
	for <lists+linux-omap@lfdr.de>; Wed,  1 Oct 2025 06:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3328B2D77F6;
	Wed,  1 Oct 2025 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uh/fxsUD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D99B27FB2F
	for <linux-omap@vger.kernel.org>; Wed,  1 Oct 2025 06:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759299280; cv=none; b=pmcs3qtK1ne9l22GEAaYBNaI0qnz6NduYmcE1/8xMrKGA0Mk0Jsgl37FNcx8y5DTrYeXj3hEI0BFyjLUjcqhC8w6FqxcK2RqFk1YApA1pBZYIswOltVTe1qt+QvjQhtBH5pVOShROFSnYPuGI06LanSm/msVBYBEcNKGBV3dKco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759299280; c=relaxed/simple;
	bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRy5X24R7gp/emZ5nKPtzwkRM0jgtB7DjNEnUDgmQtlLhPf3hveO5imwtnsdofCLAqlwifIriKuYesH8aAiyVCPoRHtAW/mGAbq5ftk+BsnPELDkvVZVfsEWk+EZVh4xVaQc5MsfYyzwnuKNsgaMHU5pmnF4oZ0FUyT0fH3c/fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uh/fxsUD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5821dec0408so6036733e87.1
        for <linux-omap@vger.kernel.org>; Tue, 30 Sep 2025 23:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759299277; x=1759904077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=;
        b=uh/fxsUDUmuawGTGXKM3Osh5B3xk0Z/svX9F8nBDYyBWVx3CSsGuXqrCd1TYba+cnK
         qU+lz32fzQaXpaBwU/8ZoEgPCAnW9b6xLDVi7t1X52BEKgyge8Ai2m/4WHHNlKendJ96
         cTFM3O+RiFp+xa28EIvyrn5EoN76sdZzUjTuzY86aeNAKJCY3K8vAE4uDC6CyWUBH0gE
         azrZmUZxlSkeu0kbBOTdClim7pbPOVfuBBWztGIakLvFuGmGfDr7VgOF3aQzPPLkp38P
         rPPm6/z5u3rSPCjEN3YXWIsUbEA1aKYnrlep5+gn1CGrJcVM47s0MSc/JQCIZd1tcnkE
         l6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759299277; x=1759904077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+pLrX0Q4NwZE9lEirGuVWH9jUzrol+ZXQHzqv0t/Tw=;
        b=it+FZd24lmKMio1/w9u3hNofaRQmLuCToDMNbLNUnxztCLron5fWgZ10HJPYdwKuGe
         8e5A1jOR2OarWp/dk9zA+HjJpl3ZaVvLKJMgnKU0ri+rQg5YLGGm3awBXUCCY6VBRazy
         eYix97VBgFMAgWb3Jb8hu5VaMZZ3QRf9NpRXag/Gzq+yXWUxL+HKgrlxuCqIWnQRlagl
         zGiPURNqtVjF8fHdKFZmOqoJmzWoAVEE4dbD9NzDR/hWmApufBwCsL8aKWsJ3M/uoELl
         tsSw9alAXdNKuiaoGyapXj8cw/JfTB0HgAMKykLYgXnAHqolgr1R7+wlQiUKXdUJly91
         6n1w==
X-Forwarded-Encrypted: i=1; AJvYcCVexmodTrp70mKm9QAbQy2S/7m8QxhEZFGciDNSaRtB7ombxWJb0pXvergjd3LRAqBlPCAQzYbijxE1@vger.kernel.org
X-Gm-Message-State: AOJu0YzYvuTAN1E3MBZPHFz7cyLLkLtAc29ZGG1i/PcP5BrM3lDbfnlz
	hX1wzqOuwZnQqfSOnNMn6qJwk57wJrxxdqBwiKHeljDVOoOD/TmO1hDf3e1BWPjjDoJia4mgzzo
	s2rxEAsoJ8UpUyunxUkuRecuFILckAHc128EnBonzfQ==
X-Gm-Gg: ASbGncuORAOVhu/nNJHehrz0qWk20C1VaE4cBlEl36qffgDDUS+8RPdEPXYXE6vYBqg
	WtEODEaU/2CEGUJ0YQVs7rxBOKndq+Vi/mXPhXTYFGNJBPemoMpUPSxa07njUy3hF6OYsQ/u9Af
	rub0nl3XP7cv9uYmQdtCm30tyWoqrhKyAocqiCvteuHad0Iiw0Db8RgYwjvS5Zz41ZimkQ7Epgp
	hCyrC762iiHYGNGpA9KxmygHrYek00=
X-Google-Smtp-Source: AGHT+IG2GQMXvM5wXsx6CzkWWALkmKJo7n9m32peMSwizZiLBt3hdl4uunMSSjoXjLkgjaoaZY2YYv9fSHpGi6xLHvU=
X-Received: by 2002:a05:6512:12c9:b0:58a:f88b:25a1 with SMTP id
 2adb3069b0e04-58af9ed287cmr658282e87.5.1759299277410; Tue, 30 Sep 2025
 23:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com> <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-3-a9146b77aca9@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 08:14:26 +0200
X-Gm-Features: AS18NWCsR4raMo4wbunxRFTWZtDHnEXvF9gNLQU5m7trixs7xTJv_rQ_r124Pjg
Message-ID: <CACRpkdar_4UR-HtBb88dKLWbaM-p_vx_Z7RBEg5szPTMbdLN4Q@mail.gmail.com>
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

I signed off the patch and sent it separately to the SoC tree.

Yours,
Linus Walleij

