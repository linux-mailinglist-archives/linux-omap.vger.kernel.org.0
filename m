Return-Path: <linux-omap+bounces-4254-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D10CAB2AF14
	for <lists+linux-omap@lfdr.de>; Mon, 18 Aug 2025 19:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BEBA3BC5CA
	for <lists+linux-omap@lfdr.de>; Mon, 18 Aug 2025 17:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1B632C325;
	Mon, 18 Aug 2025 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="YO0O7Fct"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9271532C320
	for <linux-omap@vger.kernel.org>; Mon, 18 Aug 2025 17:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755537140; cv=none; b=VMkdHNFESQMttxNRtNdt5WBGTHnlRTcLohf14vs/15kyoo2wCOgLHW8OQ3UN8JAtqDvErfvYJUADneEw8AcFrql1KVd1r6rPbc5Xcr7H+XJblxuhV+LF07c5x7hgbVBq3JMlnIzhlF0dj18GuXdFbDkD4B08zajE5ugtR3RSoyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755537140; c=relaxed/simple;
	bh=2lTqlidf5KIiwx1f9Sfw4PRDWlZWhlwkXvJbs5fGqiA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eSL1rB65EeWCA1gJnIpwy6JPTdGd5tFkfTCpzObHdnqCssm06roR/a2MNLx50T6LvsuO3Ij2fjg5XZ0jWqztgVTgo+OJsboBpNF5b8UMhg7GlkkoxqN4CyuPlaAyMliOJvwd2t4xlxLkO2MLEkSJJxfULCPf6ZCYq7kHoWu1kEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=YO0O7Fct; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=P2QvCWe6PartnF3LoWYYsGQGy+7zL+gLb3mfCxj9MNM=; b=YO0O7Fct9K+fpC+r/8Zebl8Ekn
	q1XcvYC2VDhRm2h/P9vBVIQFx+5la6aLRuhym+rkXpcDCzWjfsOswPFi6vkN2RusL5cavB8Tp1JQ1
	GrNgUxdtd20RYoGMSS+b+7zPxXgr0XdD1MUwT7iuxsILGQZfvfB3U/Q487zULzOfn5VYhEDOZZena
	9qRKrLYhyB5kLRD/8y/kSGYnximP7vRwMDQsfFXTdA0KJtM7KLLMeLtExVLc6sqQpsYxtVBEx8sJt
	ObrW7UGkUSjUke9BFYjtw8ex1xz1x0zQIaxAD5JQPo2qPbc0mfuRwNJ1R/FQ2Zvqlu5O2lQCkUMdy
	MS/fAFcA==;
Date: Mon, 18 Aug 2025 19:12:08 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Yang Xiuwei <yangxiuwei2025@163.com>
Cc: tony@atomide.com, khilman@baylibre.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Yang Xiuwei <yangxiuwei@kylinos.cn>
Subject: Re: [PATCH] ARM: OMAP2+: use IS_ERR_OR_NULL() helper
Message-ID: <20250818191208.11db7aae@akair>
In-Reply-To: <20250817083449.2249268-1-yangxiuwei2025@163.com>
References: <20250817083449.2249268-1-yangxiuwei2025@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sun, 17 Aug 2025 16:34:49 +0800
schrieb Yang Xiuwei <yangxiuwei2025@163.com>:

> From: Yang Xiuwei <yangxiuwei@kylinos.cn>
> 
> Simplify error handling in OMAP powerdomain, voltage, and VP code by
> replacing open-coded '!ptr || IS_ERR(ptr)' checks with the combined
> IS_ERR_OR_NULL() helper.
> 
> This improves readability and consistency across
> omap_set_pwrdm_state(), voltdm_get_voltage(), voltdm_scale(),
> voltdm_reset(), and related functions.
> 
> No functional change intended.
> 
> Signed-off-by: Yang Xiuwei <yangxiuwei@kylinos.cn>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

