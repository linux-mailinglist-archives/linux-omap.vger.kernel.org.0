Return-Path: <linux-omap+bounces-2937-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8599FF573
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 02:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16B2A161815
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2025 01:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D044B641;
	Thu,  2 Jan 2025 01:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ckx6QLbD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465F74431
	for <linux-omap@vger.kernel.org>; Thu,  2 Jan 2025 01:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735781293; cv=none; b=NKskw6hg5OVb4ztCLYfWkjf0nB3XrC09pbN9ZtRXMQ4uW2Phdu08i4o6NdXi+nOMixRoiiRKSrlRtRzK5sJubnRy0Rxy2ZF/xc1qJdwSwTID+QnhpP6+RZ0103iGIrr0BEUEDdAP96BWU+j4B99TQgYmqijMY93bgSKp/R5zzk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735781293; c=relaxed/simple;
	bh=j5A+fNOs2v+iDXy9gnfB/Cm/s+5oEu/VzCUjXzL1flU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ct/jQoD/q11mUjhlYQ1CTwxNwKJe6AJeXhuLbKaUZ87kZ1GKmrTNLhwuTgYl+uw+Vyq+NEj/afFIc3FwuyE8Nh7on22W8z8S1c1thjI4OIgyJks3DiEleJ4LtIbmFFgEyX57Ws0rhwmdvtspt33c6fYZMQa90ZLZZUVAxPAQMIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ckx6QLbD; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53e384e3481so10667868e87.2
        for <linux-omap@vger.kernel.org>; Wed, 01 Jan 2025 17:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735781288; x=1736386088; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5A+fNOs2v+iDXy9gnfB/Cm/s+5oEu/VzCUjXzL1flU=;
        b=ckx6QLbDrQERfhjHo6fAW9BARvthd6YwtyOZ9052MFb3CCRXE84v0iCrgkPjTfUY2w
         pxikkBKjLy0NmBSERFykVK7buNV31uIi6cUdazhe5p04uPc2aF1EwdKMHleQduXvwKWU
         e1sh0xP3e2Qlqpm2+AUvAJ9h6Tc1ldC0BK9mRAQtzZaC2Jdg+lWUcIRhd0y/EzaEUWos
         dew9nVvHIT+sf3Xkn7zsntM85eXMEzsUG0gSKe8hOqrBMW3Bnk0DYt0PziFZQNG2yPMQ
         QLYcmS/GwrXG5aQDbBd6awR29n0gq9e67uB1l9eKuSbROI7uixJZXp44jeFzpwDy/s3d
         ZQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735781288; x=1736386088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5A+fNOs2v+iDXy9gnfB/Cm/s+5oEu/VzCUjXzL1flU=;
        b=Gm/5h8ws1NPSsl+QS+2swaJFW28i8J5BKe839ieDIPeR+AVB3eFq2+MnXBo6NPyhTx
         12vso5+dKCgaf8O4agAENOmqCSVT2ozegsN1M6kRYOYKnXB48o1cG1hEROxSkAPUmsKd
         s0jt0KVbffWprgNhoc1+QjLIVFYOqt1ImLLm5Uv7SPDhqxD87/tJMby92/hett0AteH9
         3Jx4RVi87763sSQj8eCI1GLL9XU+IOqHIlHZUBLx23sDehsZYsBzWcAjgROLg9Jo6KKu
         qDW37A9ASi+qzH1aHOByX3aYfActiZp53Ygd+Qb+SWlKhwtcqKbZQGI8MokGZJnUU+BL
         TdRQ==
X-Gm-Message-State: AOJu0Yys0Nmcq7QOf3rARoLpy1pZlItzUnvMLhYB8PXLwpVFZAaLlmip
	KRypeZkoTTiRuV4a9d6byzouJT7fyNJWxef2KJXgUZGK3XYm1AnBLAdpv/wPk6O/nG3biEjqmp+
	BfreuM78zlo2iI9vKyP44FEeQzEb39BwP+25kMQ==
X-Gm-Gg: ASbGnctuDqMSpfChp9/tk0o9xI+V/F8aYtHVBTYmxQv8YVHIj4GK+SSR/bQq+xwY6H+
	Jictc8QmrwShAfRE+TC4DRgIDMcAxvCBgpv85
X-Google-Smtp-Source: AGHT+IG/UDsEg+0XNkiO7o/fl6fn+k5MfWwRaGYodEMlM7U/ikDReDME0rwrPQXTrVNcfbKoL7bMCXkw0iHb9fPnuCU=
X-Received: by 2002:a05:6512:318e:b0:540:2fd2:6c87 with SMTP id
 2adb3069b0e04-54229533e65mr13622135e87.16.1735781288248; Wed, 01 Jan 2025
 17:28:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
In-Reply-To: <Z3UxH_fOzuftjnuX@darkstar.musicnaut.iki.fi>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 02:27:57 +0100
Message-ID: <CACRpkda4uVYGZYZEWxyS_Tw9ZC9EfiZZ1D3oshZg3fh+N7zL1w@mail.gmail.com>
Subject: Re: [PATCH] ARM: omap1: Fix up the Retu IRQ on Nokia 770
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: linux-omap@vger.kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 1, 2025 at 1:12=E2=80=AFPM Aaro Koskinen <aaro.koskinen@iki.fi>=
 wrote:

> The Retu IRQ is off by one, as a result the power button does not work.
> Fix it.
>
> Fixes: 084b6f216778 ("ARM: omap1: Fix up the Nokia 770 board device IRQs"=
)
> Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Sorry for all my mistakes :(
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

