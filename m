Return-Path: <linux-omap+bounces-3577-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B84EA850A4
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 02:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 401529A4336
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 00:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21C82AF11;
	Fri, 11 Apr 2025 00:39:33 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA9179BD
	for <linux-omap@vger.kernel.org>; Fri, 11 Apr 2025 00:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331973; cv=none; b=faJ4l/BO9QoMBYwU/vAnn7RBVVGpwQjXHFZAKp2sXWfh3R3napIAxR/jia25ClQKGgqp7OzQwPzEcWYm57uq7JuiZ47ovtioesWxreHkEIoXjDQ3gOaJMjbzyCjGNaIDTkDF4IzhAwk96W84BF7/jCoGs9eDEIes3qjyVw7TseE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331973; c=relaxed/simple;
	bh=e9D0qS5c9xuGHL/ortzIXle6NYY2SiyUiI7O3e/dBck=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ew8+4WgAxDsr48kCsmve2YuN4QzhnLC+lzRxZ6D/ZVEyVp36aQbE/1Xenc/itCcgaiJXE8Aal8/T0FlydDsq0D5prXyvGPiYSr1dYktC/aZMazIuwzEKel/+klegRxQjH2sTwa2fspyhRQa2cDz6r9NHFfTFqwJfV2KpwyRsI58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2264aefc45dso20750165ad.0
        for <linux-omap@vger.kernel.org>; Thu, 10 Apr 2025 17:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331971; x=1744936771;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e9D0qS5c9xuGHL/ortzIXle6NYY2SiyUiI7O3e/dBck=;
        b=XsauMtyOqt188PtrPnZEJm8lrpWkQhFgafCvPpeZPeqA4EQA0sCMh5WLRRJ7e1RfqC
         qGVIHDDb//wSscr64IiBZQ6Qa3PMg+BU1EtLMcvo+dkvLr+N2KkgF2QhTg+dJzMvyJRj
         igmzkEffIA7vcT4Cuzs1OxAeI+AAspFPUTCEDY7dNQaxC5R3ca3OCvFw2DU3npVapneG
         kc3m02PzYo5VAlND47sWaciEKiAGk81hitqWi7p8kHwAHBx6h3krkoEUUHn7ze++1tyR
         8mAPSM1hK8gnhIESH17u7ft3pzLIpLa++FkSrikzd4n2uZag6kX6a1eYCFVQXADAETUj
         7flw==
X-Forwarded-Encrypted: i=1; AJvYcCWDIiKz3u3y21McXuQ+MCMdwXe+Vd+0u4TK2P7GpMdxuzGK3FS+i1669zoyaaUmTtfMwuezBFAgj/VB@vger.kernel.org
X-Gm-Message-State: AOJu0YzTobaMgMsns9U+2Nby4BNGJE5YXvintRC1HujqoFByN0/5Adi9
	d3T+/WPiJjhXdb/EkNPTUfDOK93p+r9+yaJkmxobuDAzpiHGKPUhZnccS7KUH38IiXXGN+ctaQ0
	CZzg=
X-Gm-Gg: ASbGncvlw6dBiQxedWFXcODqeMk3y+O5BvecC9BHTk8+ucBqBgYYZbCST6qdNG9W2He
	2Ci9UFRKV8F7lxz8SaK+WLYa5fTEfuylIvTw5M9xe0UaHwUPAHRnuZnoTbMyQjmPAqZ0azSwwYU
	3M1e6eL0yvsFFS21KvN1lMw/RTWUeTx7VE/bqP5JVpmUSGG2g7xtjz6omXNGlspxikXyCVHu8YT
	OAYEezkjsbqYJ95fIfTzVeXJchEMElWM5XPN254ICq7LkJdlmzg7C/vWmMF5n2hrMh+wzUFWbqu
	+gYeEWJZtUYZvLqArYUpKkAUs51xssS7mY3breEOaEVCiFTJVw==
X-Google-Smtp-Source: AGHT+IHE46ZClxLKC9hdNZdcLjjMQRYqIyIdTcUA0yqBYfKQO0vYwM2JBDfdFcSq7VTlGW9xIaW8WA==
X-Received: by 2002:a17:902:ccc5:b0:224:376:7a21 with SMTP id d9443c01a7336-22bea4fde7cmr10776535ad.42.1744331971575;
        Thu, 10 Apr 2025 17:39:31 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb5c5sm37254655ad.222.2025.04.10.17.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:39:31 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: David Heidelberg <david@ixit.cz>, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Pali
 =?utf-8?Q?Roh=C3=A1r?=
 <pali@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nokia n900: remove useless io-channel-cells
 property
In-Reply-To: <20250213203208.93316-1-david@ixit.cz>
References: <20250213203208.93316-1-david@ixit.cz>
Date: Thu, 10 Apr 2025 17:39:30 -0700
Message-ID: <7htt6vwmyl.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

David Heidelberg <david@ixit.cz> writes:

> This property is irrelevant for the ad5820 DAC,
> the driver nor the hardware indicate use of channel cells.
>
> Fixes: d510d12f26f4 ("ARM: dts: nokia n900: update dts with camera support")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Queued for v6.16,

Thanks,

Kevin

