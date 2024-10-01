Return-Path: <linux-omap+bounces-2286-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3F898BEB0
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2024 15:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28C5E1F220E8
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2024 13:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D701C8FCB;
	Tue,  1 Oct 2024 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="PQiPWADI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33E01C8FCE
	for <linux-omap@vger.kernel.org>; Tue,  1 Oct 2024 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791053; cv=none; b=npOOhQkgtJKHMdJ+Ci0gXpJBIg9913Hwz3jXVJFq2HBMFAoTEX2f8NywUA6j43SmhyCv9RENyr4pmd6/VYg5DsbSiX4yoYEZW2ngomV5MssSowapYz8KZFR+MPigsoswg7Zg0bbXbb9K0QLXaNzAtSC6VfaxElvzHDemKaB72zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791053; c=relaxed/simple;
	bh=tU+rT3jHPfSlQ4P3EjN8ZFvptV03KWRVGxYC5+jLrrg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=UXV208W9a5LNnwss9C1kIkmtS2fn4X/nSt+d0+PSqrJyUw98SZDOVvbCbGHqD077SGA+gfEMLzFc25AA2nTJl6rE/Iewbg3jfAvjahEHHpVLoCcPDF8byvKPr+3ySxqPWIfHx8xLdEatzMm3NKLcv712IQTShfjYKZT6tEYy7oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=PQiPWADI; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=nyt4QMRCO8b80oOCvQeQNhtP1tpWKgeDL4PfIRy6O3M=; b=PQiPWADI69PJzlEhgN2ZUavec1
	UVhzVl62G6fE/YCVRnNfxy87l1TG7aGwFjjqGBnkm8UUYS5k+woDriwFMSuMklyBXc/01u4oLwtK0
	NN40Q+4jahWPsbFo5JQ1L4bLB5OIhoRqYp7BszBqps8yRIDagVxqIbgk54qCiCmoEeIBprbC6OEHo
	Q1t1LbkKRhPmQQttUg4g9xxClC0JiPnKpe0c8HesYnDn6OBRIoprBdkT6QV62n650HY5ZsqrpAgQC
	zoR0CnWjpg4NkNSMUG3kVHVmujq63E/YpAEPVHkqveNp9mnd8KYXHoyovF0PMJxL6hhVzU5Uv9vKH
	PPnlMFhQ==;
Date: Tue, 1 Oct 2024 15:57:28 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: linux-omap@vger.kernel.org
Subject: __omap2_common_pm_late_init too early
Message-ID: <20241001155728.55a5bb1a@akair>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I analyzed boot issues a bit:

On the bt200 (OMAP4460) I see:
[    1.647430] twl: not initialized
[    1.650817] twl6030_uv_to_vsel:OUT OF RANGE! non mapped vsel for
1375000 Vs max 1316660

All that is called from __omap2_common_pm_late_init

Well, the second line is the consequence of the first line.
TWL is not initialized yet, nor i2c nor ti-sysc.
So that cannot work. Probably it did only work in days when async probe
was not that widespread.

It is declared as 
omap_late_initcall(omap2_common_pm_late_init);

In the past there were some stories where omap3 offmode could only be
enabled from userspace... So maybe more trouble here because we are
doing things sometimes too early.
I am a bit unsure when it should be started.

For comparison, other places where things  should be done  when the
system should be basically known:
clk uses late_initcall_sync() instead of late_initcall() for disabling
unused clocks.
regualtor uses late_initcall_sync() +30s delayed_work for disabling
unused regulators.

Opinions?

Regards,
Andreas

