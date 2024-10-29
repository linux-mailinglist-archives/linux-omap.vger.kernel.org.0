Return-Path: <linux-omap+bounces-2500-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F03429B5025
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 18:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A8C6B22D12
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 17:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9861DA0E0;
	Tue, 29 Oct 2024 17:07:59 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B901D6DD8
	for <linux-omap@vger.kernel.org>; Tue, 29 Oct 2024 17:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730221679; cv=none; b=BEvg0IaGljJKQyELvTPa+bHaico0WwFRvAlxm/2Sir207X35aEk9yAMONR6950SKZKv8n7Abpx7O+An47E5cOFheiXzoK4XmmxHK30uKM0/2696B/yo07lT9EtFIjVW3nsWjjTpGQCWdTsLOzeOUZjmllnlI/x9UfH9IulywfkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730221679; c=relaxed/simple;
	bh=vMlcxqhH9M0oMBn2t50QyORix8uNGB6ufNOx9xzdqRM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ARscnN/Sp7FFyuyCVda9EmvQR+AZkPX1wBJgqFoPZvbjsUrKBMxEggn2+wddMwdc0C2eKXEh1v7XxjZQK6a63cRS9dFUmls1Yy1uQB1VVVj+2pY4KVXWTKOYrrfgRSUgSINRHXiC4mgZCoBJn3PRNyB5XnWFxi4+mwT++XerPJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-20e6981ca77so61302885ad.2
        for <linux-omap@vger.kernel.org>; Tue, 29 Oct 2024 10:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730221677; x=1730826477;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMUpO4GHw4JTvBKu5JvINhynu0MBcZcJA0tvXvTxH3I=;
        b=FnJnmszT456IWgvrQJ5ub+rgD+iwOIYD56asoitl6bMPp6qjliC0wiVjUQrzxz9z/k
         uOHSCOwAEX4Oex2IfcVMIYQoxAc3jcD5/9X1VVu+3DL4PXyYs9S6Ta95HNEy2X0lIosm
         mUe1WAnp7x245/3bKHmAyQypnE0PxdkBqsQd8n9rJDnYQbVR+uV3n50SDCKqXtHKnMTT
         ZV2mxPQhChsiNwK20wNtl4LEtXEKSDI0sk9oVKRmsYH+1pcxQa9w7fSEG9/nEoxVKyNy
         gcOa8af8yNZo1PUzzltXItw5HTOLBQUnHbKWeEKz6aUwcOIUUdwfFEGgIZYsqqXscfBw
         ZtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFrv+yceVqzMvCDZPakTWppcMlEl4mtOFhZ4artRcRbg3g2sRyGqOoYiQMNfUOFKyplgwr9CZ2J1vF@vger.kernel.org
X-Gm-Message-State: AOJu0Ywunc/4qYCV1tJ8DBy27OL9YzUuUjMx9Suj/2maSOQgZKKQEuKC
	5RkUeZp09ZmKJTTtssptQe8k/tYeJPRozXDCY0pkbgJofbmEIOPh5KJ+XPOt4Xg=
X-Google-Smtp-Source: AGHT+IHQ6hqt2GFIDvzxzB6z/d1rlXeJz0yqkXbJH8u2AzK+uLr+X4awDkW0ZAHg6kt+Bt1a+fJPTw==
X-Received: by 2002:a17:903:22c5:b0:20c:ce1f:13bd with SMTP id d9443c01a7336-210c68ab683mr167590195ad.18.1730221677056;
        Tue, 29 Oct 2024 10:07:57 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf46cd4sm68256225ad.41.2024.10.29.10.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 10:07:56 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org
Cc: hns@goldelico.com, b-padhi@ti.com, andreas@kemnade.info,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
In-Reply-To: <cover.1730136799.git.robin.murphy@arm.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
Date: Tue, 29 Oct 2024 10:07:56 -0700
Message-ID: <7hiktasuqb.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Robin Murphy <robin.murphy@arm.com> writes:

> It seems omap-iommu hasn't had enough mainline users to avoid bitrotting
> through the more recent evolution of the IOMMU API internals. These
> patches attempt to bring it and its consumers sufficiently up-to-date
> to work again, in a manner that's hopefully backportable. This is
> largely all written by inspection, but I have managed to lightly boot
> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
> working again.
>
> This supersedes my previous patch[1]. Patches #1 and #2 are functionally
> independent, and can be applied directly to their respective trees if
> preferred.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

I tested this on am57xx-beagle-x15 where before this series, I was
seeing various remoteproc drivers fail with

       remoteproc remoteproc0: can't enable iommu: -12

and now with this the remoteproc drivers are successfully loading again.

Thanks Robin for working on bringing this back into modern times!

Kevin

