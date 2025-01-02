Return-Path: <linux-omap+bounces-2945-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F98A000B3
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 22:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48FC01883C97
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 21:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75261B6CEA;
	Thu,  2 Jan 2025 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGN1QV3Y"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193EF1B3944
	for <linux-omap@vger.kernel.org>; Thu,  2 Jan 2025 21:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735853535; cv=none; b=D2sHzMu3BzcFAEuZ4dmWZtuBUt8E3/+ynfaV7xwAFdWjGGxqC2P5da/7ZGGgIqhTWwdiMHZn0dAaJvJSkwMuDKRi+K8+zwRuTPKFMnnyNsFtbgvQk5hyUuuqBiWR3lRbZ0OB1HCB9LsRWEcPpJghrblOfdvv/I37OPmOJDwPlXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735853535; c=relaxed/simple;
	bh=Wtxk84fUxHeb9OopHDTm5hClINIiEiJ8Jkjyo0bNZEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqNltIqIAo24hXmvtNiqFNQcD/BbblkDkZS0FwE5ugWseluvUtEwgCPI4Gv6rdDBouzeGOpnqEggr35qcWqgKyBMGNhUWL3xMom+JP8FXV5DkUS7zSWBy4L2T3Bck9cyaiz5vhtRqERoM6zx5nLld8mf5rHDwP+9Owa5VdLcBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGN1QV3Y; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f22fd6832so13363061e87.1
        for <linux-omap@vger.kernel.org>; Thu, 02 Jan 2025 13:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735853531; x=1736458331; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjY1FusYh1YryKHAN4zvFm2UZSdXvuV/zDLKxw4TcA8=;
        b=EGN1QV3YYDljyw1O14pYN3vIpmQE9XgnQDFXy2vj3ZuaYrhO5qdOJUCZQR0/Cy5sL2
         k+nKDglR2vfWJt5kd8gDjzr4zlSyB66Tzc+uLem8vlSw40OMJ4YqyGHoLv3RKh5Zg6/Q
         0U/eEH7PpO49saSyqFOEHAsXLB5qUTXhWBl4LkV+0gmsiTMxCr+tQ1nlZKXto+kqRCI4
         Gei5oW7zGm08+/nrbvm8jIRV+MoAFmmfq3oAc5pp1IsmescVEiD0+oeRGV0U/UbCwpat
         ShAenP2j9PFTewYwCURtnz8hu6IuCZq36qTvybOkvHkRiFg69ciPHh3j3QePp+7tGA1X
         bPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853531; x=1736458331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjY1FusYh1YryKHAN4zvFm2UZSdXvuV/zDLKxw4TcA8=;
        b=VaNsMQa0ZvbvMD7pZglwP+U+zDoq4D2SkQOJewHbdgR+T/gshOVlmfNQCZ6JVefwjO
         qm8gqFaf9GtKu8TIdsvPcOB/Vs+t6AtoCPb35UF2II25CxJ0cOhouwIRicn/NlS8ZJTe
         Zwjrxzz5FguMo6K/wHyLU133Qq5vCx0SgDWHXTVlvH0lNf9kdLuyA1lyMNr+KjdHC3Sc
         baZOvcLIpgLfgN1bc7HbE1wPASL+1l/+nshMOp4CGIPm3TIHfaf2we7rtM02gB2zb7jj
         7yBN7rVCdnnqAixecl6H2MwcN8lJ3/OWcY2tWJINK9qT1Qg2AzwN4WsDVscMlwok5e/k
         mLTg==
X-Forwarded-Encrypted: i=1; AJvYcCUPhrLGrFrj1jFBA25oMRzXhwA9A9L74bsaS1wrrglusnrAWRUUmhf7umiGOFKurCXHQiu2R2Qd6699@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Yk+nhugrQfdOnnASDIG16wzPdApL21E/atdSIXlHzwBA9i3a
	JmAaV5Rxx3NL1JkftG1Y2JlLkVZhZ56EQLGd0yIX59KMptUEzIdTCLd2QzROQfVAofWCsjv5HWg
	F16xcbhvU6p7mP57uiQJ2NouLz0s7vzrwDlQTJA==
X-Gm-Gg: ASbGncuuaqyAHuUo6XJgpkKbwLVvcBAk0RqRibdwOqaBleW+z7ODOEidIgye4XIiDZa
	hDnbgseDQu5tYGPIaaXgJg3JeoiykdQMdaFwk
X-Google-Smtp-Source: AGHT+IFlli5v1Leswr5mSGgujdwQIN4FjO+4y/Gz8GAuOwdSl6akwXzEIS6HSR/IZ1Qe161dv3tbI4KcYzqniYCjvoA=
X-Received: by 2002:a05:6512:1283:b0:540:1b2d:8ef3 with SMTP id
 2adb3069b0e04-5422956bf40mr12610797e87.52.1735853531271; Thu, 02 Jan 2025
 13:32:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181953.1020878-1-aaro.koskinen@iki.fi> <20250102181953.1020878-3-aaro.koskinen@iki.fi>
In-Reply-To: <20250102181953.1020878-3-aaro.koskinen@iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 22:32:00 +0100
Message-ID: <CACRpkdbfuQuTQ028=hZgRhOPiw5AbPLyoZTbRCbvNDQ-e8UajQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] Input: ads7846 - fix up the pendown GPIO setup on
 Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Helge Deller <deller@gmx.de>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-fbdev@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 2, 2025 at 7:20=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi>=
 wrote:

> The GPIO is set up as an IRQ, so request it as non-exclusive. Otherwise t=
he
> probe fails on Nokia 770 with:
>
>     ads7846 spi2.0: failed to request pendown GPIO
>     ads7846: probe of spi2.0 failed with error -16
>
> Also the polarity is wrong. Fix it.
>
> Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

