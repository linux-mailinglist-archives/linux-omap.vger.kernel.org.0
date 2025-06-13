Return-Path: <linux-omap+bounces-3873-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B170AD9280
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 18:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D9A1888C52
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 16:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166131FE477;
	Fri, 13 Jun 2025 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8hMhHkm"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659671E834C;
	Fri, 13 Jun 2025 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830752; cv=none; b=R8UGuP+l4gzaE0PTwm2SdBgyiThfaI4OromFDu+T/9HyocdVOL+fC9lEk+xb13lNAbfVWgGcWCT4WAguQl2klyGi1HqPRRjoJjKnSJqdy8I2ggD0fqPGam/0jYD33ZMrGqA1lZMIMSlx3QTFea7SeO5t5j8Yw3UR+vHmGso160Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830752; c=relaxed/simple;
	bh=mBrLzA5ur/SlC5AN5M2PdYJv6t0e09dXg58E8o3mblE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8bAZQcAkar6wAlUw1ZGPBWPUrKzO4/kVZGfVlhJRlPTP2uzHEDq4W4UjpApJbiX/v93C1beqNt8k0PF+Iz9jBmVHCPhwVokrnPFXJv2WFGIRJHIWRSHpNxGKPuPbrFCyaqLo1d4A+UTfvS0hpw+ubUtLJ+Tr74Bwa9r90Y88bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8hMhHkm; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2fca9dc5f8so1770713a12.1;
        Fri, 13 Jun 2025 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749830751; x=1750435551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBrLzA5ur/SlC5AN5M2PdYJv6t0e09dXg58E8o3mblE=;
        b=G8hMhHkm9XbT61dLuBE/iICQSjUxPSSRlyngh4qgSNpIYWL4FFmECMK8EZtRbOO7Jb
         F852mxw8vSj2N1WCG+VY8JQLxhtfFLC8PJKja3K/sULGfViO0ol13V24mGh8kCKrdBTX
         iqSw7b5hlDlnvX33BjcTFpMlrgWO4cnBMiDgu9x+QwgYDivZwJlYO+7JUP+pgpe4irYI
         +RXcXZt+uv7k2d1uml8K6hzjLCgbHJK0ePgtg5JM0UH8IR4OzijdyPejWpIKfZlOzPik
         89GtZyGlEAI/rTeiWwrG5lHEFfsBY2TjA7EifzcL1S+nCc2cVdSg6/lxHS/5kVf8drpx
         XPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830751; x=1750435551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBrLzA5ur/SlC5AN5M2PdYJv6t0e09dXg58E8o3mblE=;
        b=Zw7ToSv77Ep3LXVRploTx5U72C689awFzD8LRAYYD9c2qFju7fV9Bp/9/qaCiFR9gn
         RrLW7+sr4/pg1uPEJy+RQuDs7ItyWprzUql6RilU5TFtNM+VNfpP063tGAVudxfnOM1M
         ee1zPCjxIv5+uZP/4pT/+t+94apVPDJIb6q9ArEEEn50wbQUUXBJIIWcOByESz0/mBKE
         TTU8auz2X8kuUXy94RcZUVutUcsZzdL6ops0y0AJSdChnFJMkQ39Js268MhVCIc9fhab
         g5SRI9JTzh+s4X/EHbAMCGmQppe2Q2L2hb/V1DX8ggPmQeFq3HNsFOuZ5O5ZcAExjX7Y
         RJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoW2jbmHsJOVG3/aQDk1SOaq30M1fJlLb6c3QKLEitP+nuS1W9kS4uv5+DGZmnN1hynSWNo5oVkmoo@vger.kernel.org, AJvYcCVahXLyvzIbclvaIomKh94fQerC/0PGMMKYfvkDDm1CO5cB58pVoB/h5IDcEBq0Vb5xUA/YfA3NturQ9TXr@vger.kernel.org, AJvYcCXsD583cWJmrfgrZTG8MOssDQKvOPQUn4GrM3HeWcQkLFlVwUsP27cD5E7jJ8anx9qcxOAY2UsnXqm3NQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUHS+RJfqE4dFfvs4jlYbVnJg3AHv6LS/Mg97NTzafU6gqRFS9
	dgEDrEoVmm4lK87UfiZ2Di8xJif5QI8denzNTgYY9JhS1W2uTGp1YfTPh9CBNmN8FsMQ/1De5ol
	3n9dTzudEldh51ehqEdv9ahYrLhc8Jhg=
X-Gm-Gg: ASbGncuf3KxDrqu95f2T44iqCMVGkOcgydeQCLp+k6hf/Biw4uNIYh6BdHlH+cOAXA+
	aICIn20qqwdbzp35+J50CDg2nVAoNEZ8ujGOho0UaKgZRnu4ulRmadTSeZGi/Qbtvq+eDnws3oz
	ZUHFTnM7ueFSnQfUdFu9N+zqOkxQxgF5WDBE0vNdKMbhL8
X-Google-Smtp-Source: AGHT+IGkRwuBDi8P1hGdy0piKZzS+a+5N+inyeIw1I7jmEwifkcgqsBw7iDP3Xyu6Jz+spOq3lm/iRfZkorggjRDPA8=
X-Received: by 2002:a17:90b:2e44:b0:313:28e7:af14 with SMTP id
 98e67ed59e1d1-313f1d5efe4mr350773a91.19.1749830750557; Fri, 13 Jun 2025
 09:05:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com> <20250613-bbg-v3-4-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-4-514cdc768448@bootlin.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Fri, 13 Jun 2025 11:05:24 -0500
X-Gm-Features: AX0GCFsijTlH9k-tyupTKWkiHQY6VEd8JiYrIAPf2uoe0h8I7b4t84UjPXX0FBg
Message-ID: <CAOCHtYg10H537Hu=kMqgFashuNHK_pDFZ_SQsLaJjG-efP9_Rg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: omap: Add Seeed BeagleBone Green Eco
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:51=E2=80=AFAM Kory Maincent
<kory.maincent@bootlin.com> wrote:
>
> Document the seed,am335x-bone-green-eco compatible string in the
> appropriate place within the omap family binding file.

just a small miss (missing e): `seeed,am335x-bone-green-eco`

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

