Return-Path: <linux-omap+bounces-1-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B97F2287
	for <lists+linux-omap@lfdr.de>; Tue, 21 Nov 2023 01:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FDD51C21569
	for <lists+linux-omap@lfdr.de>; Tue, 21 Nov 2023 00:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DA417D0;
	Tue, 21 Nov 2023 00:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PciNlHU1"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14B917C5
	for <linux-omap@vger.kernel.org>; Tue, 21 Nov 2023 00:51:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9F1C433C8;
	Tue, 21 Nov 2023 00:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700527890;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=PciNlHU1VEijoVr8W8j6dYV9nHSgx9kwlcjQC5negFqQ/KBrg2A3Ef+PZIUZNqPL7
	 UhDgNIpLwposTWVW3WUgHtmLrH7dtAVmPTuSAH+9v7O95y/2db9xuzhgoN1R3qGcRf
	 hD1+7MPXEaPjUq0pL+/1KD8MzGmIbiOWBVFSDQnE=
Date: Mon, 20 Nov 2023 19:51:29 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-omap@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-mighty-agama-of-champagne-11e33d@nitro>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

