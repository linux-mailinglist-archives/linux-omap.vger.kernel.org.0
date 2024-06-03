Return-Path: <linux-omap+bounces-1452-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E758F9F1F
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2024 23:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 282081F233C4
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jun 2024 21:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505C613C805;
	Mon,  3 Jun 2024 21:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="draCQutM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6694F1EE;
	Mon,  3 Jun 2024 21:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717450905; cv=none; b=U5YCJ7xadIkPLt+o/4RW8OEQdNKf23amg1AQfVe4hiMh0zZvfGlR7uYu3tovG/qn61KlthnpTYxcTnIEj02jdW5uurY1vQMTG0TvB3udZmtLh9fBn5oSHluxSA4IEi/3tMzBCRd1R5SNUlEfp4lcfgp4Hq4kX46J1PK4vRM/Xz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717450905; c=relaxed/simple;
	bh=tpUrNqY4FkEDDxPsV0nGW3ExusFdQsKzaQoa1bbE3+E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=pZIxJ48jPlRsXtGoxHb7JQG7Qd5HUFBy4zB7I52ZKyUL6D8s/yNvz1Oyh4nzjH0eHxdSQZzUpyVeV4tMCl+Z4CR0H/VzVNDflCqQAkpEVY0tmhQfnOrA+G7hzkzQUm/Xlyo5Ap/iZ+5r6KYu3RcDK9TUD2Wm2N35dfz4/Yjfpm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=draCQutM; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sEFQy-008iye-2R;
	Mon, 03 Jun 2024 23:41:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mECr+0yYQ3o07FypcUd2rfqn9MmI8qAiS3TgF2g/mxg=; b=draCQutMlpkrh8zj+94YhMINki
	EoTvD1ldlYzuwEqQwahirwW5YerDHtKCMo0eUwdBxRIc9oZ36mEuPRxLIgJRyFIWt6/L0Vja3T1W9
	h21FLisU+mDa1sKEPPa3K/AOcxbVtyMBeyKxyh675AALdkcKh/hM5dRwI/ofPGxRVi9Ctc2bcEl7U
	S1yaPY0mjsioatPmO4IUW92benlGNkx4agPCm1Hc7Y6eNMypfl6+CWFKuTiPxK/2zFe4UDg7r3Ftn
	H/NKQh9mT6CdjFd9EDHWvzyAJUVRuiz6amB/sEBO/bdWoUx5/m5tjZ2qxqiMsMV3UsVLlokL2qGcZ
	gALdZwXA==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sEFQx-002WPx-15;
	Mon, 03 Jun 2024 23:41:40 +0200
Date: Mon, 3 Jun 2024 23:41:39 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org
Subject: clk mess on omap4460 with mpu clock
Message-ID: <20240603234139.280629b2@aktux>
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

just stumbled across this on 6.10-rc1:

[    1.475830] ocp:target-module@48210000:mpu:fck: device ID is greater than 24
[    1.483154] ti-sysc ocp:target-module@48210000: could not add child clock fck: -12

Maybe
        /*
         * Use clkdev_add() instead of clkdev_alloc() to avoid the MAX_DEV_ID
         * limit for clk_get(). If cl ever needs to be freed, it should be done
         * with clkdev_drop().
         */
in ti-sysc.c does not work anymore?

The offending clock definition is in omap4.dtsi

clocks = <&mpuss_clkctrl OMAP4_MPU_CLKCTRL 0>;

Did not bisect that yet.

Regards,
Andreas

