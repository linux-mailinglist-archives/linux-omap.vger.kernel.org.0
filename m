Return-Path: <linux-omap+bounces-4950-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FF0C6D51D
	for <lists+linux-omap@lfdr.de>; Wed, 19 Nov 2025 09:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC2843A47D9
	for <lists+linux-omap@lfdr.de>; Wed, 19 Nov 2025 08:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF93329381;
	Wed, 19 Nov 2025 07:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFIoUq8j"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675BC2DC32E
	for <linux-omap@vger.kernel.org>; Wed, 19 Nov 2025 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763539012; cv=none; b=WtdRV9u1VG+0I5ptxrdq3/poUxKohwJW4AQ+DOfFiXVN2HAv7xXDOO2kSOWDkgOvU7wNPnRc4FC/7nDjM9kGNx6ZTlCwf9IWWvXpYQDapyCxOVRy7sEOullnuFYnOy2DfMgSJ8pjkO2OJgB1OB8a6cxj00QppSi8EzDAlbWwx80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763539012; c=relaxed/simple;
	bh=Wl+eqGRqfTTSr73sNBFdhSQqOrm3v/7atKhJ2Ue8nRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uaERkWZYutHGOzo6eRMCgiOq/aflm6QyKCFdkyv6qdnA0Cs1b4gJUuqYGapfEbx9rlPeNiaDnRI7PLXb371aIRsqi0wPp9dGRK7oQXtbRCJ9Dw6UmlUFB0CEUt0TPvkRVRZea5+odtIQU6T4ZL2U/aYzFF/dCm+6aHVdJgLP768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cFIoUq8j; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b75c7cb722aso247853066b.1
        for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 23:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763539009; x=1764143809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT2jT53GtflpgtsSSARNMehrU8xMcefHmEbO5weE+H8=;
        b=cFIoUq8jBGkxS6Nm+iIernUD4Jw4H3KjuHGzf7JgJYADTcSEUddK5r8tz2oghhqxj9
         f78zclONnAb4rs26C7XQNzOq0THYLV0VXnxjkrweuzaYT1a67OlGV4l9IwFV9BpngTZI
         wWfzxYVVrDaB3re+hLDkZZYYA6lPKW2QCQhOYbj+3g5WjZcAKbrt/OY2CqZKfyDrHVK2
         tuaMTaYUbSCnmPQXQgIyPb7gcQ6YuXbauyAYEv68T7wLo9iC2776c5z/fUGM1VURALi7
         eLQM29keCVUmwccS9s/ZDUIQUScq74Z+/6uHsknzRYxfzQ7Y6PzGG1V7EbRbCIEWpZ6E
         fUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763539009; x=1764143809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XT2jT53GtflpgtsSSARNMehrU8xMcefHmEbO5weE+H8=;
        b=AJds9IBAwLVhiVyb9KF7jDcgpJm/qq8mk7yYP2KpBFDEroh6h8KuxJF6geOR3mzZtr
         m//yhXRXkS9cYRkXCCOlebXVQNrq1hLUaTsYDSsEkn1BBSgDp9vVH6rDA8HwPDL8+IX0
         kheZd/YQdi0++k4B09H3onxngda9hsM6lUjAAb9x6yjjp7+2Gy7LN+MKCRchGDceCF9X
         Z2lzmtZ4E/b9k9iJ/NmUStaMIkgAzvenvmRkoVCzCnC6/3s0zdigzB+UTMBhsTsP6r0g
         SkaBDlhLGqfbPsn1My9Y2GxpIT6MKCN4lCjiHsiA6VcysKd2gETBEjkYwAjERqZkZr6S
         u8gA==
X-Forwarded-Encrypted: i=1; AJvYcCUhE35OIHeYhsxJaqMQ3VOtRZXqCG8PYutDTopOcTl96S23e48I67f1OKu4WqNz1LaxWq6kuacPoIRe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4EcIv/ZxiVEJDDv3F60s9xmj2VVuJo0bA3UUjxrq/xsWLJqX
	KynEmQi/JXbYhlPBPa/0Glk7k++iJ+5gHN3mwC1Gg9zMJqfSHrO/BovFvoq52Q+ot2dKPuOUD++
	kSvGSOrvLYgMamxulwvJkNWMQR4y4WlI=
X-Gm-Gg: ASbGncuTS15g+kgH3/j0dd568YjC+rLYNqVuX8AynMmoZpXHF6eMh/P2V1oNXO05VTA
	mGf8VH7MQ/KdhK0KevIFF/ezN9yjQAgpggcvJ02os3Zn4p2Y5dueNkJR4cCtAuRkcbmHt2Uz1bl
	dvmyLl7NhDtCXlBV85cHQZaDopCHoKLf6yBytZmyqCyuRJ4+VqXQNLgD5dJYq/qiQ5Mo3wLw4tP
	c6F/4IvaSgjLRJsEpBoUFO95AmxMj+mI724YHFgRQeWNtumiYc1IdNKqvi9D9xFRf4JCJT2pvNS
	l3uBofBH7+Wrpnjv7PfXYZ2xlldrSxvFQ7ZNanvVHggdUJQDe2AyK0hzDPMekUonaf4pqCIAUaE
	7ZShn2O8=
X-Google-Smtp-Source: AGHT+IHkr98iv8RkJCJVqsJKrbJ1+s/zkdGOwfF/rH8mGb3+ej0aXWY1sLaOq7gDCGS9Bl34YEhC4czuLVOsZWaGVgA=
X-Received: by 2002:a17:906:7304:b0:b72:a899:168d with SMTP id
 a640c23a62f3a-b73677edba0mr1946935566b.13.1763539008473; Tue, 18 Nov 2025
 23:56:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-6-jszhang@kernel.org>
 <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com> <m2ecpvm20y.fsf@free.fr>
In-Reply-To: <m2ecpvm20y.fsf@free.fr>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 09:56:12 +0200
X-Gm-Features: AWmQ_bmed1VXCExSbCiDJjR0DcoAiO6hz3YdSi7TR0YlyvVDegjc7dB_x9IoTzM
Message-ID: <CAHp75Vf=HYugUGDOPdXGaMo9tDLcji0H9ZX7NehN0NoBGYjO+w@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 12:04=E2=80=AFAM Robert Jarzmik <robert.jarzmik@fre=
e.fr> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> > On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang
> > <jszhang@kernel.org> wrote:

...

> >> -#ifdef CONFIG_PM
> >>         unsigned long   saved_gplr;
> >>         unsigned long   saved_gpdr;
> >>         unsigned long   saved_grer;
> >>         unsigned long   saved_gfer;
> >> -#endif
>
> Actually this is not equivalent to what was there before.
>
> With Jisheng's patch, with CONFIG_PM disabled, he adds 16 bytes to
> the
> structure. You might thing today, 16 bytes is nothing. True, but
> on a
> 64MB RAM devices, it's something.
>
> That might not be a reason to reject the patch, but it's not only
> a
> "modernisation patch".

Actually a good point! On the same grounds I semi-nacked the gpio-dwapb cha=
nge.

--=20
With Best Regards,
Andy Shevchenko

