Return-Path: <linux-omap+bounces-4629-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9374CB549A1
	for <lists+linux-omap@lfdr.de>; Fri, 12 Sep 2025 12:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3E4AA74E3
	for <lists+linux-omap@lfdr.de>; Fri, 12 Sep 2025 10:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0692A27EC7C;
	Fri, 12 Sep 2025 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="WZqPLugb"
X-Original-To: linux-omap@vger.kernel.org
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0308D537E9;
	Fri, 12 Sep 2025 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672586; cv=none; b=CpiGi2XYDAIpg+tfWNAI9aKA5k1V94nonOKoNSJt38gpxE3IHBIMS5JG+CdKtXzVlCiaOsAITdtCDlvEkCZK+XlC7wAJKZXmIQmoPTu51zUWBcu5zRJ3gBoeZwlrYZxMXNf1guhij0DPyUt95l0j0pHzd0CNh39BuKDiQUO/uq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672586; c=relaxed/simple;
	bh=tN7P6v5sfZH+msC369aZKNDHjgZrDH7iq6KkXa65nB8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=WfvLfFBe2iSAVKUi9rRYMJ6LtJLincheG6bsDUBBme/dlEK+YcFN7lofYZ3lkgYvSNM6ysIVKkIV4GZ0Og4HNi9KmWTrR5kLlrYGzr936KG54I6l+bMK7boEpCgASpHcVvyxNSISCt/zd/R/PXF+iX17/nJqzhgVRE1J1c0yepg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=WZqPLugb; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1757672273; bh=tnvwqcCpSywl2Olfq3XdA5wGX6BfSifyemOuhgWuHqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WZqPLugbM0gyuBdGZJVbp/HB7aBRrs4mok2s9He+2MwfasKS9s7KjCwGe0IILCg53
	 zqXCB/df5ewpQRzLmpc940kVD8fufkoFYYmM0u8UfGIh/s8hH2URMzZDFYT5Mt3FSW
	 rXbkf/47QIKnFw2C9VA7a6SeVoCTijuTQxIsDu08=
Received: from localhost.localdomain ([116.128.244.171])
	by newxmesmtplogicsvrszb42-0.qq.com (NewEsmtp) with SMTP
	id 4728902A; Fri, 12 Sep 2025 18:17:50 +0800
X-QQ-mid: xmsmtpt1757672270tisx84y31
Message-ID: <tencent_5D5D6F9F6C5ABBD25E4C60151B1F52CF4006@qq.com>
X-QQ-XMAILINFO: NvH2zBBgt3uTp+V9Xksp8bMeZfaA5LhupQLmaA4p3d97W+l37sGOy3PDNWGczm
	 HUqg1qlMI9JxJg+8mGoqrYJAHHtBE9pQCwHlF+NOa0ZNEC/terF+OigEtd1LUM7jR6OHMZih3nLh
	 gFSNR4eAqtojlM3fiaeJY4u0nDahOCBJWjkRGNDAtOPn/z/rPDrluJjXYsH7t60OIwC+u+4u5vw6
	 gmnCYsVoOp+u5oeQFoSe5xLB3C8mtaqUXhaTA20tc+MnFeDrQXg1lW01xppLOsdTbZgGUtyjWJqO
	 rsqvWX6FarlMUlGdGC2klKjoGsm+I2AoK+/AuRrgVVkOITUWzkjL0WoEk3sfLYioignmm72VTQIE
	 O/O1FRDcMTYhmznIURtlzt3ePpFEQXWlSrP1UaFT3dLes0dvKT7PODGy5muU1KyfFlA0KJLoi+de
	 pPAL/o4fGyQcS8IoG37Lkus2CrvgYHNvWtaIslGQZ36mgvuMJ4PKOIN0IneHOhGRMsp7K/HwQGGi
	 qzkpRdGY2qjVt2iFw5Ocr8JQf7VHMDI5/Z8HMtpo3gtZQLPcq+CvtItqm5SPSELvqbjkSP7R8pkn
	 dtVaRYCKX428Kqg3F/9n8pDfbcZdUUywc1l4DX9yWWbSt10mjGZUGxScG5Wy1SYDBAprC0Oykjtf
	 FAV3fvoISB/lkmbb1iQjhxufDU4tmh/xTUBWXh/PyWAIeDLr/O4RpWjkheZlNAaB9XAVSGttusGL
	 Gh57re3PMaQmvzqqWm2kzsh676C30yS1nltxYJch7L6FHjebg1nkahvKvEkujRFexc4B7cctdGgW
	 BeBFcKAmYwpcy5/0daj7pnEfqx8Vh51ODBKWrLUL2JCO35pj4q3xwbFGaqgL4ZjzWus8oPCijgKh
	 44+xBy0vHd97NALhFTpOZJAJL/2PPMjrAcHSRSIVKWkG9+UiO1p/3W/jNbtCZPIn8K918p6Z3sax
	 kQmzh2NH1P6oxtCrA3SUs4CRunsLO+ccNl+oFkD1pWShBjCX6Pro0UsbUPoYsVRnJdGEMYNsKMmU
	 h8HWabXipIs7lWi/f8fTho3L/UhYSjgmNph1AY0A==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Haofeng Li <920484857@qq.com>
To: tglx@linutronix.de
Cc: 920484857@qq.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	lihaofeng@kylinos.cn,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	rogerq@kernel.org,
	tony@atomide.com
Subject: Re: [PATCH v1] mfd: twl4030-irq: Fix unused variable warning when CONFIG_OF disabled
Date: Fri, 12 Sep 2025 18:17:50 +0800
X-OQ-MSGID: <20250912101750.1982109-1-920484857@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <87wm66s50g.ffs@tglx>
References: <87wm66s50g.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


>This #ifdeffery is horrible.

> +	irq_domain_create_legacy(fwnode, nr_irqs, irq_base, 0,

>        irq_domain_create_legacy(dev_fwnode(dev), ....

>Makes all of those problems go away.


Thank you very much for your valuable feedback. Your suggestion to use dev_fwnode(dev) to simplify the code and avoid unnecessary #ifdef conditionals is highly appreciated. This approach indeed makes the code cleaner and more maintainable.

I have noticed that this issue has already been addressed in the latest commit, and the changes have been implemented . Therefore, I am closing this submission.

Once again, thank you for your guidance and support. If you have any further suggestions or require additional input, please feel free to let me know. I look forward to continuing to learn from your insights in future developments.

Best regards,
	lihaofeng


