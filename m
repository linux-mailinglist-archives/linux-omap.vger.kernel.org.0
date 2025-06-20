Return-Path: <linux-omap+bounces-3942-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FCCAE1DE5
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 16:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92FD03BBE74
	for <lists+linux-omap@lfdr.de>; Fri, 20 Jun 2025 14:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD752BDC14;
	Fri, 20 Jun 2025 14:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUlvFFFb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C72BDC33;
	Fri, 20 Jun 2025 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431200; cv=none; b=FOdlzmoiRkkIY3ccC4DkYe8TVzljK8i42QR3h9JOu0J2/Fr2KIXJwvn9ovk1kJRFRlbt0b35S0gYe84k5oodFqSLuYreVkLpRwudATPt1x3RDaMMFRAkiyouoj5duniaRhSr0X1y0+83MTuJffx/5SzvSYAGSWxNbGBO9c+v9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431200; c=relaxed/simple;
	bh=FYw3qI4LKamXMfXnq/aJyxvZqyZsPTiH6NjrftPeufc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEwGpCaxZjYkDzFqi97DtioUnQJMtPYR/Gvtb0IMA8+KXXicwh+V7BLlftgnw9n0aP9OWmFp9pc5I2RdTpJVC0+1o/97RE8LHrBVxj7HTfqnd56pIA9OaFbJ0bCMBNg7JQuoELDShkGPqzrM6CyiZgteekO7+2G+lxA6TLio49k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUlvFFFb; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2f0faeb994so2047819a12.0;
        Fri, 20 Jun 2025 07:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750431199; x=1751035999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGgbzDDPQ5dvEOVSs/l1UQUKcv1GpXtNGh0s59IKkpY=;
        b=CUlvFFFbgJJCcpF6yaWrSGjQZp33UN2jItvg7kUfwmaxiqsYeZ+M+CNeBHMG6Tvnf2
         3R9gFjt61khtYX78Ub1qctLdCNGp8tfJgpU+TdH55PWGNT1Uy1IBxX4CwwAZB8fgR2Uy
         WH7uVr86m9JBc14yliyTefC+6RnnzLPMwpu4Cym3l0lZTUzUDvzfmCSz67rjzHmSR7E0
         5IfeCsELt01a9IWw1Lt24dcT1ofR2xRpprea5J1IFjsx+YGBzOyOkY1P7ilmYGUN9xTP
         kGWivBrA0cpDkNk1barsSBXqo2ajfjVpDBAFPja3U2H28ePYjlhAQ/+T5QlEIENhCiHI
         p9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750431199; x=1751035999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGgbzDDPQ5dvEOVSs/l1UQUKcv1GpXtNGh0s59IKkpY=;
        b=b1/JNWXeVta8XE/XIcgDEhpsyHooJQQEBXVFGmnC+6FTZDZ6KeBvlcdVlKHPLfGCz7
         kmJQDcVnyQ/8s6CyKJqvxVARgn/DUpXZ+2UuxZDxuvaeUu2Qig3lRiRctFy7iSK+O9Aq
         oB/nvu7BSEP+mz+4KkPzbA8lSQU5QGZlXsf7SXm14QSP4usipOSkNl/WnPqZ2p24/RHp
         dIqF7e5suhdx//X+Z/hJqvV4QJ33VAhGKJuohO7w8GaLh8iC4P8AI0ZeinERSHmBJSBu
         /0sAK3JJR6JFHa8bvzcd811bx5rDb5mTXkLm/xyOVRFXBpwqRWs5kPbM9KCfOdYVD2Xb
         8nmA==
X-Forwarded-Encrypted: i=1; AJvYcCVmZVBvL9cMV85nfSNrlFuoEoQdkflnHX/5sJ82yPVzYUEs3cM/3lrx2ZJzdrr0Lxu16o7vgEohWiQnxw==@vger.kernel.org, AJvYcCXlocDcbSIfTsqhyjTIDsgkQsypDBbd71qOHNJWwivkR0SvK0lpe8dRg4MTZKmqKrx/cU4PoAbsCXdLKMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoDVOv2jpOdNHXhHgmVb3tryq9FAnZSOz7qUJ7XWL+Ru/OB1pi
	clB4fqhWuhRPsJatKF+729+IK7QYi3ulauPn34y+wCMM5oA1LZ9faYfqjWgNpVnR+xxglcEeWcr
	dAx/Lc5/ZltUdJpgBNKJSRTpS00OJmNA=
X-Gm-Gg: ASbGnctZE4QN3Ujy4s56/CaRc9y3hou1sgrZlEvFCp7F0+7XIB3f2xXvZTjhI+fLrKK
	S81nMO84w0drtEtVy3cECDPIjet3T6xHtlo+JNP6QkWJR6HQWsimmvBTXfC4K0gTiCqSrvExTV2
	JIokxU6EaU6S4kC4b1DslHQ9HQIrRGP8HojOswfqGgALaE
X-Google-Smtp-Source: AGHT+IElKXlbjCTqedHStYkSTke0XOg2ZxtEKOUd3ikrlSXsOorel2hCjw/ReVox2zPxd8t6ZY8prmc1iKvV4Bxhxwo=
X-Received: by 2002:a17:90b:53c5:b0:315:6f2b:ce5a with SMTP id
 98e67ed59e1d1-3159d63da58mr5497327a91.11.1750431198619; Fri, 20 Jun 2025
 07:53:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620000924.2636542-1-s-ramamoorthy@ti.com> <CAOCHtYgweLhO4nNhNLtJ-_25guqER7ohDf7TNy8WNFwo898wPw@mail.gmail.com>
In-Reply-To: <CAOCHtYgweLhO4nNhNLtJ-_25guqER7ohDf7TNy8WNFwo898wPw@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 20 Jun 2025 09:52:52 -0500
X-Gm-Features: AX0GCFv8BxLuNuDhqVagKxjvmUjxjAKfvVw3MA72vCMYEIsGtRIGiQoJqo8zqis
Message-ID: <CAOCHtYjYTfrJ_pNCsQOXX7Hj6A7wBXKdMQYvog-5h-=WLtorhw@mail.gmail.com>
Subject: Re: [PATCH] regulator: tps65219: Fix devm_kmalloc size allocation
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, lee@kernel.org, d-gole@ti.com, 
	jkridner@gmail.com, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	m-leonard@ti.com, praneeth@ti.com, afd@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 8:30=E2=80=AFAM Robert Nelson <robertcnelson@gmail.=
com> wrote:
>
> On Thu, Jun 19, 2025 at 7:09=E2=80=AFPM Shree Ramamoorthy <s-ramamoorthy@=
ti.com> wrote:
> >
> > In probe(), devm_kmalloc uses pmic->common_irq_size to allocate an arra=
y of
> > 2 bytes, but pmic->common_irq_size is being used like an array of struc=
ts.
> > The param sent should've been pmic->common_irq_size * sizeof(*irq_data)=
.
> > This led to an issue with the kmalloc'd buffer being corrupted and EVM =
boot
> > issues. The common and device-specific structs are now allocated one at=
 a
> > time within the loop.
> >
> > Fixes: 38c9f98db20a ("regulator: tps65219: Add support for TPS65215 Reg=
ulator IRQs")
> > Reported-by: Dhruva Gole <d-gole@ti.com>
> > Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>

Sweet!  With 4 PB2's and 2 BeaglePlays... Power on, boot, Power off,
wait 30 seconds.. (repeat 10 times)

Before:
36/60: Bootup to File System

After
60/60: Bootup to File System

Tested-by: Robert Nelson <robertcnelson@gmail.com>

SInce i applied directly to rc2, here's my fixup of your patch for
reference: https://github.com/RobertCNelson/arm64-multiplatform/blob/v6.16.=
x-arm64-k3/patches/fixes/0001-regulator-tps65219-Fix-devm_kmalloc-size-allo=
cation.patch

For TI, we also need to cherry pick this in v6.12.x-ti, to fix
BeaglePlay and PB2..

Thanks Everyone!

--=20
Robert Nelson
https://rcn-ee.com/

