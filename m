Return-Path: <linux-omap+bounces-2425-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290C99F3BC
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 19:13:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6CFB282E4C
	for <lists+linux-omap@lfdr.de>; Tue, 15 Oct 2024 17:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37561F76C6;
	Tue, 15 Oct 2024 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KyCS5i2n"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C715B17335C
	for <linux-omap@vger.kernel.org>; Tue, 15 Oct 2024 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729012396; cv=none; b=soAvT1N4D175qWuBCu9hwcX18j8qGtI7BJK7/dOtcY/Oavoujz5V4ko9/g7QvZvf2zyTd326VP+hqLIVMHvXl3Bou8N3/znt7HEYWMH+oMBDiR6Hxg4T8VIRViMDVdnKyHZpeulHsaVvFoi/X5/WuWXSD7QRB4zVfkghA6w4lKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729012396; c=relaxed/simple;
	bh=lOuEqEf935Y0CXsBy2Yu7PTqswWBdjJGcyVDk13g8Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iYW64Uy2ZwneveEQ2J+RQbXyhf3ywfTmnvnj1AVTPVHpm54i3RnrxlKDEB3wSMBrL//CQR4u3ALmPJM54ZTh74/jIBtRMfg/tfowfhZtjOWqex82YM6JGquDQvwhCC1ld1I5QBFHiBo/IomUBBTBlIkKjrbosk+OgtN5CIkNpB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KyCS5i2n; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb57f97d75so18837501fa.2
        for <linux-omap@vger.kernel.org>; Tue, 15 Oct 2024 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729012392; x=1729617192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DiPm4r96ebUEyaZxC+805tfF6sT6Y2BwaLiml4Z063s=;
        b=KyCS5i2n1u1aMyufkSJW2urfoXWOr8ET6m31Cm8y27NWEdPMGrwvYbw+k/rqjdESMn
         E2xs2NUwsr/GDqrZ+tg07pfGqFBn1veMNDIKj7TR4RV5VM7TTdVdFJL+f5pvcqMLUQWt
         xrEm9teKdZNSjDnOiWCW8OqO56u9agjy5wEZkPbp9ilcuhDCaemx1Y+UdsbhQMZU2Wjh
         LYqhM0FGUr9o/AR8GansRdkpIdofjIovqRuzB7bTVCrDBPBcexd1iTofxzdvrz/vLedd
         DpH9ZMXUz5VU30ZYFjp9sGV04T7cz6A6JqdLYsY6bPJvs4dHWxEl0cUo92eWZURHNroV
         PL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729012392; x=1729617192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiPm4r96ebUEyaZxC+805tfF6sT6Y2BwaLiml4Z063s=;
        b=ut+EluKwivED5ZZnldIl3v5grZjOGyu5/L1i1achArUMl/pEH3ubOmwJdRhTfTLayL
         rHU9YMT9erFtTIZ25Y8ddLdEueQJ0h0OetV7Py79xTL1ElkveTqyX2VygzRB+OR886bY
         rR5iW9Rglmboa7mmxGulz/B/WfH6k8ZI5P3wfRyKa+A6Q5X75RDrYCdhbo5ZGno8M8UY
         yF4ZxTRgYvfkKBkUYHgJzlVVCUyJ/nsp9WhILYkF1x9d/O55jwr8NCQ+3kEZ9LrhPc75
         +jv2x2xDNTszCYZaI271NPE/4Y/0abrjVck82l42row6UkLq3E5u7WhbfJLrfCPZGfkW
         7s3w==
X-Forwarded-Encrypted: i=1; AJvYcCUhXrk01r+ShzAqqx6hdJiogAyNfQlrItoHGtyJJUW7KxyzrWPJHSzukpdINKthGtu1YH1vWywXf/Li@vger.kernel.org
X-Gm-Message-State: AOJu0YzIG17xGYY/RV9gwKG9rIDAMEb9tIIv6YREykmxMBT8uZlRG8E+
	/Wo7eH+DQDtJ63R9kT1lQKrJFgscKVLcsLqQtsOn0ZB9tXGu/qwXyu1VBNPOpYN3tBfWrmgKugl
	dqo380D689JJDfK54PykHZPSbl7vieniynNkXAQ==
X-Google-Smtp-Source: AGHT+IHSFf6OgOjGOdU4U9kmnDcRd4b/LJVxuMW7RO8tVxyUI3rcOG2c/0CoFQJ0SPMybiwd1Euo1YTe6v1iUUtEOWk=
X-Received: by 2002:a2e:2e0c:0:b0:2fb:5cff:fcd8 with SMTP id
 38308e7fff4ca-2fb61badb33mr7155341fa.34.1729012391812; Tue, 15 Oct 2024
 10:13:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net> <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net> <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
In-Reply-To: <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Oct 2024 18:13:00 +0100
Message-ID: <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com>
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

On Fri, 8 Mar 2024 at 15:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> Thanks to everybody for your input on this thread. My
> proposal is to drop from QEMU:
>  * all the PXA2xx machines
>  * all the OMAP2 machines
>  * the cheetah OMAP1 machine
>
> leaving (at least for now) sx1, sx1-v1, collie.

This has now gone through. I'm now looking for test images
for these remaining boards, so we can keep them from breaking
when we do refactoring and code cleanup/modernization.
Specifically, I'm looking for:
 * QEMU command line
 * all the binary blobs that go with it (hosted somewhere that
   doesn't mind when our CI downloads all the images to run
   its tests...)
 * ideally, exercising the SD card interface if present

Could the people who are still using/testing these boards
help here ?

thanks
-- PMM

