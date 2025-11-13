Return-Path: <linux-omap+bounces-4917-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AECCC58BF9
	for <lists+linux-omap@lfdr.de>; Thu, 13 Nov 2025 17:33:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D0AA23601F3
	for <lists+linux-omap@lfdr.de>; Thu, 13 Nov 2025 16:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671F435292C;
	Thu, 13 Nov 2025 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or5QZeP/"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFBE34D395;
	Thu, 13 Nov 2025 16:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763050027; cv=none; b=aSw5zj/qVsPRNr58xM/AcYfy9acR4idnr9Y44ElkTRR/lyYtBOMSXcRVHIo3qRgMNv6Ng2wVvGRGEcn8V+zV2X2q/FZoAeZFJTvBIKltA8wJ9XEG433oFU2KF2nYMPLd6tSVjSp/LChdeniXh8gW14iAmWTQABKqwD/csi7ujFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763050027; c=relaxed/simple;
	bh=g+/FYjcz3WYiDo8+OgGvPY082eJaIJCtja71aw6bHxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bmVWFwLM/1IznjKBz9IygbZHX+Q/kSc7NiPFnWmcz6XJ6Ml3HbYt6WDRujGywTwy0SoMJZQl89LscqXQjqHEoK5Nh5JFJ0GXMBTB9t0eMMZGRyMZ2c+vsEvIlshbvkJH0pX2ojHkld7Sg8nz8RQ7dhOHWR+TyocTybJ/aMX5hbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Or5QZeP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99ABEC116D0;
	Thu, 13 Nov 2025 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763050026;
	bh=g+/FYjcz3WYiDo8+OgGvPY082eJaIJCtja71aw6bHxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Or5QZeP/i01cj5lNVBRNT2nBAVuIqbCt/FlFRJycUkRfVhsXoXGC5nbWgekehPiKd
	 1QEuhRq8IJ3td16ectF9Ec+6SpEO5BSXEGVr2/rE7wo6YdkU+PdQ3bSzJR3uTfDvez
	 n2FTilav6PUER2/MkDBM7hiSCgTfc1WqagnMa5wK33SQEttWx9fWI9TLbPtrNLp/pB
	 zFbr8uqUDX/MUjzbER9vW5/H+JQyv/eGEBRY+shRnBHN600oJ+/bLRVdnu4wY9Vqy9
	 /fPRCNC5DbJzNdVldYUqJCtooww0QXP5SaRDbCo+iyuME0CfAOkc8RXGT77gSbJ9Jw
	 EwJJl4SSx2t5A==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>, 
 akemnade@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20251106-twl6030-button-v4-1-fdf1aa6e1e9a@kernel.org>
References: <20251106-twl6030-button-v4-1-fdf1aa6e1e9a@kernel.org>
Subject: Re: (subset) [PATCH v4 1/3] dt-bindings: mfd: twl: enable power
 button also for twl603x
Message-Id: <176305002333.1560960.3842601279717096522.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 16:07:03 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 06 Nov 2025 10:00:25 +0100, akemnade@kernel.org wrote:
> TWL603x has also a power button function, so add the corresponding subnode.
> As not in all cases there is a power button connected to the corresponding
> pad of the TWL603x, the functionality can be disabled by
> status = "disabled" or simply not adding the subnode.
> To keep things simple, follow the established design pattern of using const
> interrupts as used also by the other subdevices.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: twl: enable power button also for twl603x
      commit: 65a4ee23e057f60d25c3436acd88f2f169f780c2

--
Lee Jones [李琼斯]


