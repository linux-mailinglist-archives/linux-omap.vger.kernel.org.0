Return-Path: <linux-omap+bounces-1534-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F144B908A62
	for <lists+linux-omap@lfdr.de>; Fri, 14 Jun 2024 12:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C3E1C22407
	for <lists+linux-omap@lfdr.de>; Fri, 14 Jun 2024 10:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482F1194A72;
	Fri, 14 Jun 2024 10:46:28 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from 3.mo561.mail-out.ovh.net (3.mo561.mail-out.ovh.net [46.105.44.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBB61474C4
	for <linux-omap@vger.kernel.org>; Fri, 14 Jun 2024 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.44.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718361988; cv=none; b=dsqmaId2hQefkeBnew0KqNb6spHGV5bsS7xZCq/oUaxNTbBa5xDWx41xgXLcPAYvUUp4qQa01xl0zq8vSTz2EUsIA4nv9P0is8CYxSfzGYttBT7HiD0mjFxwFWb/bXqBN0/tSNa6NbMB1UKoE8SrgCMpY2qPVhKmAMhxXeXr2ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718361988; c=relaxed/simple;
	bh=2WQlCiqaq3O7GAO7I86Mkd8Y6gJco5eKLlFWHR+F8P8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n7+3/dJ81PPRbolvt1eGm5aYPsA4VrtVJ1Sd02I71rmIrIxUjqqUaAiKIphSz8WLtegZ0EgVT1pjI36elHADrIfJcvEhnFYtVJpv+dKFepBYqWwnPsiFb+nPDXXVKUNzmEJCPKgHM/fhHl/f3OeZ6ojYeteq1JKJ9P4AQiDJONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.44.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.25.52])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4W0w1P6xhlz1Gxk
	for <linux-omap@vger.kernel.org>; Fri, 14 Jun 2024 10:07:05 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9qg8m (unknown [10.108.42.28])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 50FEB1FEC2;
	Fri, 14 Jun 2024 10:07:03 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
	by ghost-submission-6684bf9d7b-9qg8m with ESMTPSA
	id w4LqDkcWbGbfGwAALME0rQ
	(envelope-from <andi@etezian.org>); Fri, 14 Jun 2024 10:07:03 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-101G004c23ccfb9-6d11-4112-99e6-9496b632ab70,
                    0BE8417D4949A2B9C3DC4A53BA17F3B68AA5397D) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Thomas Richard <thomas.richard@bootlin.com>
Cc: linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-0-aab001eb1ad1@bootlin.com>
References: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-0-aab001eb1ad1@bootlin.com>
Subject: Re: [PATCH 0/2] Wakeup the i2c-omap controller during suspend
 stage
Message-Id: <171835962034.690946.5223670414905950648.b4-ty@kernel.org>
Date: Fri, 14 Jun 2024 12:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 1605814746184223393
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpeffteehudffvdfhudfgffdugfejjeduheehgeefgeeuhfeiuefghffgueffvdfgfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeduvdejrddtrddtrddupdekledrvddujedruddtledrudeiledpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqohhmrghpsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedupdhmohguvgepshhmthhpohhuth

Hi

On Thu, 13 Jun 2024 15:13:26 +0200, Thomas Richard wrote:
> The patches of this series were originally in the series "Add suspend to
> ram support for PCIe on J7200" [1].
> There is no changes compared to the patches in the series [1].
> 
> The goal is to wakeup the controller during the suspend stage to be able
> to use it during suspend_noirq stage.
> As autosuspend is enabled, the controller can be suspended at suspend_noirq
> stage. But runtime pm is disabled in suspend_late stage. So it's not
> possible to wakeup the controller during suspend_noirq.
> The trick is to force the wakeup of the controller during suspend stage.
> 
> [...]

Applied to i2c/i2c-host on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/2] i2c: omap: switch to NOIRQ_SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS()
      commit: 659eb16247d04f442a014fe2dd8b7fa936dfccb5
[2/2] i2c: omap: wakeup the controller during suspend() callback
      commit: 8a2ebb775a497a95a79a8ac83027a4f159c36f32


