Return-Path: <linux-omap+bounces-2504-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CF39B53BB
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 21:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 130341F24375
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 20:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68981208216;
	Tue, 29 Oct 2024 20:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Et+rln8p"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6323A2076C6;
	Tue, 29 Oct 2024 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730233825; cv=none; b=anYoktfJEEjeL1RsaruCH/LLmAUKpEEmIq9DYQhWcsQLe3GKgL2tbfrvE2bi7CB1NibMXIkGUTK1JuWIcmjpLyz9dJM1PzPO8UzZsF1cN5mAgbo6Vmp9NQ+nAXA3tGzpFLivghXBEfowaSzT+lNMVvSyvoROCNmHbfWaFeWoGYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730233825; c=relaxed/simple;
	bh=LCPuPHxmcheRjCZu/CCyo9lhHWSqEy8+gxzMZANtv8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+yajf73bE4tBPV1vpnIG338B6L1ivBO8vjaCSbK0K8+Ytrk3FLY0auinrcYfXx7a2kNbeQX3IfOJWVNx7X+BcQirrG82FqwC1KEerNRoB1TG0dsBPEUvTROoDRXqQ3peEQUMkt/qWbrKZxTiVSN2ANtk59yLc/k1/IG9QFdKP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Et+rln8p; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20bb39d97d1so49577815ad.2;
        Tue, 29 Oct 2024 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233822; x=1730838622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCPuPHxmcheRjCZu/CCyo9lhHWSqEy8+gxzMZANtv8I=;
        b=Et+rln8p0CydBo2vWmqYnosQY2ldjHldXuPrChtomqjvi1cPgeUIi02aB+6DaGut8y
         28g5TA90LuFteiYeNT4+cIbILtXGHGhie0RmqLugxMwSJpJFcTZGq/LKscAhpla5+OnM
         gCIJ4lhNX6ZyBE2OfzfoXk9Iwzoe6SqDjeUu8e1T+nIfLaIQOguOPrjBYKo60qWo23ko
         xH5WEJKNbPzUncHiticfY/Ng9oKT89/WFpz2xs7CoziDMa3Z275gf5jIZN/3bQJqHrga
         Bwb3IvqhYjfHSnTzzOR8buldll+KjIJkvjL6DRxuq+JZIdYuCqe6kzTsIpOi7LrgyS+A
         99zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233822; x=1730838622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCPuPHxmcheRjCZu/CCyo9lhHWSqEy8+gxzMZANtv8I=;
        b=ZYXmNFT5spDpgy5LmR5nWd9hU4qS/ijAGaDi/HEqHzNFaP78c8heYuMdhkSOBn7dmm
         vcEM+d4irDeBufA3g2ERIqsBAeaLHWb0s3Ntv2pWyVZKSmWJXPtlF+8jy26JrAbGau+M
         ZzP6W9//2WB+48Vzv2SYW2mNNiGoNloXforyYruavAeMkWowFQ4ysJ5Y5dfuTTMAv35b
         184lksCR0pSaG91htOXymZLLG1OeijbJY2Ch/B6DkzgqAdRWaxFnV+mBpIWGTbKvLp1S
         f2UizqZaL8QCdnTLmm+S77SGHdW7RDN/sgel9dJvD7X81WuYaFue6wDoEZX+pSc0A78X
         ST7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQzbLQUukn1u0nJ6niQBupNd4jM0crHWymaJSTNdpRA1/jb2Px7Kzl/lcG+P2zP1Yc6EsENhEDg+pOIA==@vger.kernel.org, AJvYcCWedKaE21uDMbtb4OLoXZ3J2F6WkpLJm3E5uQBZok7SoZFdBTjQ6b4WumRQm7dQtL08TJfG5aujyrlKWRVG@vger.kernel.org, AJvYcCWyj8EYFvJtKRqehq0nkaAD05koUZCuduAZpUN19rKV7+0EPt84zCcKmzj+YtqYykEpF6nfsh9+d9/G@vger.kernel.org
X-Gm-Message-State: AOJu0YzpJjEfGrbjPMqV0/QoZBEdgnpoYxH8572Q/RWunwLEpJ+Pbcrx
	ZkMS8lJ2iG7T62Y2qiKQXq+NNnuh4pF/irh4z3aJd7kt1pn2EqKr
X-Google-Smtp-Source: AGHT+IFroEW9to+PrSxVxxL7EaDXV3zy0R6mpiRww0wu/Ae6aYY9Rv/dMYht+3SI/+mmV80Zf6dDdw==
X-Received: by 2002:a17:902:cf02:b0:20c:f648:e39e with SMTP id d9443c01a7336-210f770091amr9100505ad.58.1730233821672;
        Tue, 29 Oct 2024 13:30:21 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf46373sm70351915ad.54.2024.10.29.13.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:30:21 -0700 (PDT)
From: MightyM17 <bavishimithil@gmail.com>
To: bavishimithil@gmail.com
Cc: andreas@kemnade.info,
	bcousson@baylibre.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	robh@kernel.org,
	tony@atomide.com
Subject: Re: [PATCH v2] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Date: Tue, 29 Oct 2024 20:30:14 +0000
Message-ID: <20241029203014.399-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626095056.12607-1-bavishimithil@gmail.com>
References: <20240626095056.12607-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Well, no, the file is not used at the moment, I do not think it makes sense to have it in without an actual in-tree user.

So, I am planning to merge espresso dts (https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/community/linux-postmarketos-omap/0002-arm-dts-Add-common-dtsi-for-espresso.patch?ref_type=heads) once this gets merged, plus it can be later used on epson-embt2ws as well.

Best Regards,
Mithil

