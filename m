Return-Path: <linux-omap+bounces-1745-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E98492AD0D
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 02:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0ED11C216B4
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2024 00:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FF929422;
	Tue,  9 Jul 2024 00:21:18 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C9728DC1
	for <linux-omap@vger.kernel.org>; Tue,  9 Jul 2024 00:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720484477; cv=none; b=DsHYYh3F0m0+3O7L0+j4qoRe8ifqIJ0Vi6LjLZnYlRQEc8EmGyjmXH0CC54fQJFGmj/1IoRS60BoifXQP9qGA8sNinRyTZqNsLP/kYUAlcGGGJ/BJyx489vzduU8XX8fGaQCnWon/f5HsIgIQMdsm+ZzYWevc/GgqLMp7PZfL6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720484477; c=relaxed/simple;
	bh=de1avitQBiu1Fy1ZdwBYZlwPKhu/bH+ZiSpazxU48yY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q02eSg8dz2QwvpfAlImqBO8lrsYviwkoqxSi8GKaEYsBXPPuzUa9ial4ZBPBAgotUKnRyQwwmuVoK2H8TVZ5BYmlEaQDPU8WCAYJtbA88jRggDkpxbLNo7MF+lXUMGXx2ixXGbiEF647ndkdOIyyzREInkZ4iMjvzaWCmDy66RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fa9ecfb321so26693265ad.0
        for <linux-omap@vger.kernel.org>; Mon, 08 Jul 2024 17:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720484475; x=1721089275;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrbRzW7TmvE/emyggKx8DBxtpeVLv4H61DaYvPd4Jec=;
        b=FkLSo3Wm8eEYPM97mtDZrW1eN10GnYTjwd23Oc7MIZk6fiNq9DoBbqTNF1zGaWNUTp
         ixp5pCgeMFheru1xjFH9uTnAbxT2EYCzCJof7kMSNdgBph0vkU7+KN514Edy+l3fSFAE
         EtzL1sbhXUXcy9CwF5DA1npvAZTF8S9THL9kefmNVnr+Rz0sDOs3N9sgr06J5BxiNW5O
         LITw0g1dpCt6DQ7xmlhkNQIj4XBlnPjVmmh85dEbj7Prkv2s+1sUsnoWeneeyS8jITOX
         wKj4QLsuts8eNE9b07073USObvjXicrfjYAn6hnhogXRoqJBr0fokIbngifp2XohiPRu
         6oMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKOU5Oc40lTe1q1ymP/ZclHLewha4Wkrk2Cmxo0sGeSF7ZaVnnVWMPwPMI+I+6ZYT7Iu6kOfMJ0PAXV2772BYnTuZS5w+Y/I0TUA==
X-Gm-Message-State: AOJu0YxPYz9wzagXwjk23kcbIEfXaQPTRmnlqbI/dYtCW4RnwLtyyaQW
	5WMhEJiyVslSh0T32Hk57HRmf9oCpEtZw/62dMAdhoDWc+Wd/NL74Xkpjz0Vl3E=
X-Google-Smtp-Source: AGHT+IFppyFwTeQ3Z2Thxvru++KEqbVGYMZHsFalxNlJLyydnbWVl4ppQ4d3ZcJeQ7Zn8jsELviLTw==
X-Received: by 2002:a17:902:f644:b0:1f4:620b:6a27 with SMTP id d9443c01a7336-1fbb6d25158mr8435815ad.13.1720484475579;
        Mon, 08 Jul 2024 17:21:15 -0700 (PDT)
Received: from localhost (97-126-77-189.tukw.qwest.net. [97.126.77.189])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6acfa67sm4227455ad.266.2024.07.08.17.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 17:21:15 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?utf-8?Q?Beno=C3=AEt?= Cousson
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti: align panel timings node name with dtschema
In-Reply-To: <b1f07743-a2a7-4984-b168-0f08e87ce0ec@linaro.org>
References: <20240509104813.216655-1-krzysztof.kozlowski@linaro.org>
 <171940115812.32431.4234002524799635130.b4-ty@linaro.org>
 <CAMRc=Mc8ET2GneRT_PoGvffe+c5u13zAYsRr3u5P+aRzQv4CAQ@mail.gmail.com>
 <b1f07743-a2a7-4984-b168-0f08e87ce0ec@linaro.org>
Date: Mon, 08 Jul 2024 17:21:14 -0700
Message-ID: <7hsewj76v9.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 26/06/2024 13:47, Bartosz Golaszewski wrote:
>> On Wed, Jun 26, 2024 at 1:26=E2=80=AFPM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>>
>>> On Thu, 09 May 2024 12:48:13 +0200, Krzysztof Kozlowski wrote:
>>>> DT schema expects panel timings node to follow certain pattern,
>>>> dtbs_check warnings:
>>>>
>>>>   am335x-pdu001.dtb: display-timings: '240x320p16' does not match any =
of the regexes: '^timing', 'pinctrl-[0-9]+'
>>>>
>>>> Linux drivers do not care about node name, so this should not have
>>>> effect on Linux.
>>>>
>>>> [...]
>>>
>>> 1.5 months on the lists, but maybe I combined too many separate TI main=
tainers,
>>> so no one feels responsible... then I guess I will take it.
>>>
>>=20
>> Yeah next time you should probably at least split omap and davinci
>> bits into separate patches. Otherwise I think Tony thought I'd pick it
>> up and vice versa.
>
> I guess after you acked it, Tony would pick it up.
>
> Anyway, please let me know if I should drop the patch / resend / split et=
c.

There's a bit of a handover transition as I take over from Tony on the
omap stuff.  Sorry for the lag, but thanks for picking this up.

Kevin

