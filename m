Return-Path: <linux-omap+bounces-2544-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D82EB9B74C2
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 07:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A35CB28249C
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 06:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8955B14830C;
	Thu, 31 Oct 2024 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7y22bqL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DC613B7B3;
	Thu, 31 Oct 2024 06:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730357736; cv=none; b=ZgoMnPtaNG6yZuc3il4SfYZaJ8kC980I/ko0Fh9WgdWARhw3elKc6DNjskITmytol6t/NNly3RNYPDw4kiS41DSy3NZiolEMYYILqKsnB8ARuDkDf5Ni5pWyf+aBNJk+L4slAfA0EYCVmjJHzVJI1VOQ1OCQO4wecMVQ+G8Nv3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730357736; c=relaxed/simple;
	bh=k5e7LBmNJeMJSZN6anErizq1fQ8yqtX6gXRt+viO/SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PoVDF8++dDYTGNXrdP74bujblqIJiXTCcfkY0F/r6Gdb6RcJUNYoafsRXAoidv8odVcrb0DrT06xtbwAYj3VyDi6sY7/d9pkWJL+GRPN5UTfInh1X1toMnFJ9ls8UaTpBXL+Phs2g2hnJN4VdRCZcvlEWlsbvqHc3cLW8vddnN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7y22bqL; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7eae96e6624so521421a12.2;
        Wed, 30 Oct 2024 23:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730357734; x=1730962534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5e7LBmNJeMJSZN6anErizq1fQ8yqtX6gXRt+viO/SA=;
        b=W7y22bqLGtp/Y4aAkPmrQXwVRTb/UVHn8+mSD+NdS9WlI+v8jKIJmxdbpAaEIGEWXo
         8tg+OcP9dMJZdolrNDnZ+LnIqZi3dnptVEAX3Xf+ptzNukirCnruG4gTlzuyqj4qD2kp
         QmeUidyptpUyoYgoWOMsj/MGkYOBuxcblBw/VGx7ug2XHLWNtZDm7mvGxjb5iVb4iBLb
         J90VHh9L4Hgnf8Ipf+mixrrSLNgP5ImAIFaG2SYjkNxMUNwwH5nGe5Sro4OwkRzXst+f
         82xscRuluRtg/bH7JGq+qPe+Teuq6Xmoupv3kILH6VlFhFKonfpyeLWnec/ABgWkUl3N
         pG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730357734; x=1730962534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5e7LBmNJeMJSZN6anErizq1fQ8yqtX6gXRt+viO/SA=;
        b=qE6mNHIGPEO+J8eALR9RcZgzcDG6HW2ky3qdXqZUsIl9wxxaxCeWrtTIyn8MvKe7xF
         maOHWR2qbsvKJ2K2bsgnf/y+Kcv0/d0d52+sqzI6IG3Vx7a9Zn1L7FDIIbCKfIYeyTFB
         qoGsm+KH3rnSwdWkA1/odThrtV+qIoDMSMVR+IMTc9/+qcsF/+FCIhiI1LbABOMLdZvl
         enewgoheBYUZSVn6/ZLc/oi9H6uon/pj2RIzdcrO47nHLB56VglyBr9FATZFuBkf/XwL
         XRp7MWQ6d8V7UC+0iaXoRtn0mshcIEq7lf9+RCXNENsXH3qWVEkyojtAbN0KbTzBkuZs
         P7qw==
X-Forwarded-Encrypted: i=1; AJvYcCV2hxNwQPym63uzzra4euCJznRGinUDaWjqqeh0KRcdGYKg4/QL3aNptChSdzGTaAUL/t5yQ2jj9ruCsw==@vger.kernel.org, AJvYcCVVdu6tTC2BlLBXszNvv6qNO3yiIlBEMSq8HtFAAJrNq79EFUwlVnB0uojIIPe8I2qVVAgyOlFulBCF26yF@vger.kernel.org, AJvYcCVhxmi5Z4uidTTcZXyujViH8sm93EaUIEspA7sU5rTdPfXyW5yaKV6W/wc+TezQ9QXHet+hnE3KQjDNXeMrqg/w@vger.kernel.org, AJvYcCWJ9MRyKnFHVF6YQ00MdiHf8wGXK2c3f74ROSIFOn7O6G1OkJvhWDHuQykHCcGLZHbts6WCks/7YTV0@vger.kernel.org
X-Gm-Message-State: AOJu0YwaNLYd3gzjlbu0fCP5/+HBsgloiDq4zNedaxKoB6+yyoK9NADw
	Ov71a3F2R1L1o7D6pvlxjGNYEynwOTJoV3HULiRtNdSwg2ogBPg0
X-Google-Smtp-Source: AGHT+IGbLyPOXx6DCrOUl7LkUJCGcD524sl54LQMtTqVyyY0tLYH9vOWU6iXIhcRrtmJZYzFvfe4gQ==
X-Received: by 2002:a05:6a20:d74d:b0:1d8:ae90:c647 with SMTP id adf61e73a8af0-1d9a85130demr24773728637.42.1730357733815;
        Wed, 30 Oct 2024 23:55:33 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8ce8sm626792b3a.35.2024.10.30.23.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 23:55:33 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: aaro.koskinen@iki.fi,
	bavishimithil@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	krzk+dt@kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	tony@atomide.com
Subject: Re: [PATCH v2 2/6] arm/dts: Add common device tree for Samsung Galaxy Tab 2 series
Date: Thu, 31 Oct 2024 06:55:24 +0000
Message-ID: <20241031065524.546-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030234219.2d918b34@akair>
References: <20241030234219.2d918b34@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> this has to be system-power-controller;

I am so sorry for the mess up, I was on the wrong branch which is almost the same as pmOS but a bit older, hence the entire mess up. I'll run a quick diff from pmOS and this patch and fix them accordingly.

> There is still a lot other stuff to fix here but I want to make sure we are looking at the right thing.

Could you please go ahead and mention them as well.

Best Regards,
Mithil

