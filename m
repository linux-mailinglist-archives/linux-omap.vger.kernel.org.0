Return-Path: <linux-omap+bounces-2074-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B1252968930
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2024 15:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E20D71C224AA
	for <lists+linux-omap@lfdr.de>; Mon,  2 Sep 2024 13:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D405205E3E;
	Mon,  2 Sep 2024 13:53:23 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494D19C556;
	Mon,  2 Sep 2024 13:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725285202; cv=none; b=N6wLu0wNOQdrO079WxNWgqikyk+md4NamcQmGk7SBs18Uk0xSjRrVQAb/um4jxlXeklfCrt3QJnbs1v+wCLBoJA6qgMNeH3QKs0Q+QGiLIyIapGAp5hZi6cuneyIxvuERE5aGdji8bLubsBUCqV2Wp2CA75G7ODLT2EbAyP2NeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725285202; c=relaxed/simple;
	bh=eoC7Vo0Z8zGYb7p6xxvVkvrh1N8gQvobck3gC48jZxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+eki2PjGCspqK2FFDwThQdI9/FffmiOlRsCg3OkTjEtjjlZuEuW7N3He9yGhSzkC1H8eludTlD03Hlbe99JlIBxurr2ajWbpFrCEuV1wQNVuKfiHgZwnpefLJ3xB9XoT+mYJSoJ+2RcePbK7AlDUd7isDmTIvrMM70YcS1oOgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6c3f1939d12so35897897b3.2;
        Mon, 02 Sep 2024 06:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725285199; x=1725889999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIVZ4SCF9RhVKGpVGbpDiZIJZpiVYxTpgIR0F0Tjc0g=;
        b=Gq3lhEgV2gHv5x3UsaQGP3LCiOCIgC5FX7PAN/ey9W8SuTROykQbL7U2Hd46gOZrCM
         rihVvQomhkr/mmjMPT2i3RYDn3iY/zYxaCVcu2PAYpd/6JMnGgfI4wcTHwUCD9OkvAoD
         n3PyqsB25Oms0Cd4c/NI2UNl7hk1tL1MhLs2ZzC3bu3uSi9LSD0cqPCNOh1Sy0v3P3Iq
         0krGd2FI0fuqED3EYBGk7HhyoombRY/06HbPbxS0VrZlX3WM2S+bfT6yYuLpLolzD2TW
         5SOuDGPLoj1ThtX/qjQBi2XleuoeFdx10eBB30vSZuLKEte7yTdWzhCNngKfh9MeKWUU
         XuZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd8UM3urYyUSCfDQju3J2xDd2ong0FSwLW66tkR3Wj3mIcUMfY9dl6FwW3QMQgjT00OPVEvpuI9+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqhSA0pPpVbmzONn6QpkphZPpLCoRbvQZrKAq/hGMfBpotHqxv
	CTy0FtUpPkeOC9vXC/9Dg0InhAEYb71fPrWfbUXrbrKqnIVzZx4XxPZ3oy7V
X-Google-Smtp-Source: AGHT+IF+zgsXPww+le7nFQbuDLh2YNFcpLI6l/qgnzpfIiNrJZCkUAks9LVy+c0RytQm86QEDScdmg==
X-Received: by 2002:a05:690c:610c:b0:664:8646:4d02 with SMTP id 00721157ae682-6d40dd720bdmr116457217b3.12.1725285199355;
        Mon, 02 Sep 2024 06:53:19 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d7938268dbsm3586647b3.126.2024.09.02.06.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 06:53:19 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6d6e2b2fbc4so10436877b3.0;
        Mon, 02 Sep 2024 06:53:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLbogqu6wYRxD9xChVi08O722KYRRUuT+hznosy7FU4hwMF03e+QFrDYKLcC3WNKMUbwi+dkCvx1E=@vger.kernel.org
X-Received: by 2002:a05:690c:fca:b0:6d3:f51b:38c3 with SMTP id
 00721157ae682-6d40d88d522mr133229097b3.7.1725285198923; Mon, 02 Sep 2024
 06:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240603234139.280629b2@aktux>
In-Reply-To: <20240603234139.280629b2@aktux>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Sep 2024 15:53:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
Message-ID: <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
Subject: Re: clk mess on omap4460 with mpu clock
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Paul Walmsley <paul@pwsan.com>, 
	Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andreas,

On Mon, Jun 3, 2024 at 11:41=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
> just stumbled across this on 6.10-rc1:
>
> [    1.475830] ocp:target-module@48210000:mpu:fck: device ID is greater t=
han 24
> [    1.483154] ti-sysc ocp:target-module@48210000: could not add child cl=
ock fck: -12

And on boneblack:

48000000.interconnect:segment@200000:target-module@0:mpu@0:fck: device
ID is greater than 24
target-module@4b000000:target-module@140000:pmu@0:fck: device ID is
greater than 24

> Maybe
>         /*
>          * Use clkdev_add() instead of clkdev_alloc() to avoid the MAX_DE=
V_ID
>          * limit for clk_get(). If cl ever needs to be freed, it should b=
e done
>          * with clkdev_drop().
>          */
> in ti-sysc.c does not work anymore?
>
> The offending clock definition is in omap4.dtsi
>
> clocks =3D <&mpuss_clkctrl OMAP4_MPU_CLKCTRL 0>;
>
> Did not bisect that yet.

Commit 8d532528ff6a6b1b ("clkdev: report over-sized strings when
creating clkdev entries") in v6.10-rc1, with follow-up commit
616501eccb58615f ("clkdev: don't fail clkdev_alloc() if over-sized")
in v6.10-rc4.

I have no idea if these clkdev registrations are still necessary/used.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

