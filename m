Return-Path: <linux-omap+bounces-2443-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D659A22A0
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 14:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D9BCB269FE
	for <lists+linux-omap@lfdr.de>; Thu, 17 Oct 2024 12:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4BB1DB361;
	Thu, 17 Oct 2024 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BY2ga0EK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD31DA61E
	for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729168986; cv=none; b=tg9BzTB1ep7NLM7uJ27e2TW8gkvFRM5MPTgyE4zXemm+W/MAypcE1boYWikduzqBgZQAXnVnPG3U+/GyqeHvPX4xrY0SxCZYJ/VADFA3Rk6QVNtTtHkYJXKhZE4hI1VpEtXpSbP3uElKEBNaKc1eCnihGcQmQt/8gjtO3IiqI+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729168986; c=relaxed/simple;
	bh=6ZuKCrkaLzM33sZ5bBvK6gUY6ZZ4l7azgsAmnHgjSa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlGUsrUYbAAdnTi5dxn4fDaZLQvkqdzWVwwAJ6gFk53IkogF4v5C2Np8lRWDAwhhJYSfPbEUm08P1TPc5XaWDOYZKt32m7sBtJXX94Igc6CmvOdH8rMj3dUTThr+x8lN/BVJ/fVvFBchf6vSFA1sKX+1LeqzlWyO0Yp4aNDKvco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BY2ga0EK; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c903f5bd0eso1666638a12.3
        for <linux-omap@vger.kernel.org>; Thu, 17 Oct 2024 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729168981; x=1729773781; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZuKCrkaLzM33sZ5bBvK6gUY6ZZ4l7azgsAmnHgjSa4=;
        b=BY2ga0EKMazR+rXW5SApcFBo9yfMlMHAMTn9Vp6xirmuFG/k2UaBgT1emUCMFiilhU
         gb2k2aUDwNlIbVNpLQRASxXBKbwh5S2QJ2KWv4SDcWQmwN3zm4Ij9ERZsgLMimhd8Xa8
         V6S21NeUE8mz45gDf3Jx5NNgT93ZqF4JCBHEzTiEakXZ9qeuALFJpkgKsiesmiPPJChN
         8qTIRFQnqJqguJzKd88pTMfeQmhmRxsewAMRi8bTyy9ES8tPLqAaqaGZnJoMMqlE2ODJ
         lWlGrCNmHRITrRz+OSlIPXQg1DyWYCfBO9lHoO3qmsvionGFnR4chtZl2qi4H4Hy/uLL
         V+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729168981; x=1729773781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZuKCrkaLzM33sZ5bBvK6gUY6ZZ4l7azgsAmnHgjSa4=;
        b=rNt9kL4napvindv6B7uPyGZh2SUkKoWnIfMq9g2oCPMpyVpVrVeyXS+RNSXnpVkVIb
         FVgoJVfaaTrxPewxuhALMskBQYQXlt/DlTeZSLrRquXAXktT5HKZhHrK0RJkIwFvPsqT
         Jp2sf4QmmhqMT/2HF3NZ+BStsdF+HEatYeCN5aeksSJ5GcXPD7al2ptNth+cvLD7Qfsc
         Ae7mQufyxgNGf7B6D0jYb2h0IR2t2+3I47HblsnUlrBVGoALmYMPqqcgyn454p54W2tt
         7nvsI08mG1wKxgILuiY914Fd2Q/wn1J3CvuVLw8LZHICr1BlWVqQNCLSK6IrJ1sRwP1P
         PvPw==
X-Forwarded-Encrypted: i=1; AJvYcCX2xpYI1lvMhbSkzU2VYXoH8XBC7y3vvcyiKgecaNhwU8ggna7C2WS4zCjTaVp4oB12VawMWNTTIQD0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6+bqOtbnGgf4KJ1BkZFTmBcSOgO5od2PcABFCjK8j+1dn6lC0
	JuqScmYNRowKV/Il+usQtgifvgg7KdvJHHjNuh9aFSTi7EWCSMX9X7wxRNcRQnhLC7OuegHi178
	Y+Au0UvyigbCy0CyZkw9OTHeyVgKZCbu4Mgl2YQ==
X-Google-Smtp-Source: AGHT+IEArqXHn2TZ8HnQtNR/0yn1cUP2Pz25ofAsIP5SflIArI0A2LZyQBOx8pJDoP8BFftRxNs83QuFLQwbAuPCBV0=
X-Received: by 2002:a05:6402:3513:b0:5c9:57bb:b922 with SMTP id
 4fb4d7f45d1cf-5c957bbc823mr15253428a12.19.1729168981305; Thu, 17 Oct 2024
 05:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net> <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
 <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com>
 <ec0e8a75-c59f-41b3-b559-43c057fca8fd@roeck-us.net> <CAFEAcA9AZS1dGaLG85zZE8U0d7AcrLgKXNbhxkCoP+PLmbFn2g@mail.gmail.com>
 <cf7c8f57-22d5-4a40-bd87-0f15f5457d48@roeck-us.net>
In-Reply-To: <cf7c8f57-22d5-4a40-bd87-0f15f5457d48@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2024 13:42:49 +0100
Message-ID: <CAFEAcA98=2OdT9ykg5ibDuVLtSXuq4g0PLmSbxkYmt1SyKe9iQ@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Guenter Roeck <linux@roeck-us.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Oct 2024 at 19:12, Guenter Roeck <linux@roeck-us.net> wrote:
> Please let me know if https://github.com/groeck/linux-test-downloads.git
> meets your needs. For now I added 'collie'. I'll add more after it is
> in a state that is useful for you.

Yes, that's great, exactly what we need. I've put together a QEMU
'functional test' case that downloads the collie rootfs and image
and checks that they boot. (I'll send the patches for that out
in a bit.)

(I've coded the test case to pull the binaries for a specific
git revision of that repo rather than always-from-head, so
we're testing always the same thing against head-of-QEMU.)

thanks
-- PMM

