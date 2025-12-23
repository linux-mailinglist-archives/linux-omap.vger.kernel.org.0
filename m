Return-Path: <linux-omap+bounces-5253-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB216CD8C08
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 11:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 357B2301E59F
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 10:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2223350A1A;
	Tue, 23 Dec 2025 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="neYf11cp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4HNAWKS"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B034F49A
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484317; cv=none; b=YYPmWCIT7g/iKGImiE2g2fOEx7v19hlune+ZEE9yrQwAXx9RORQYtbIi8khihRzo3LHMXjfnw+JUPPUrCDuqVYdY6Vx/OdcSlPKeS0fQgEiQ8Ok1MndXiJ0bdDpcDqkbdNzMNAs4HZhcuF4brGNtMye7+Rdx/sWFiAGKTyERkxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484317; c=relaxed/simple;
	bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/jHcwBBrOwxUVVV2JwCiYQyLIDmm5q0iz47bDekvE4BmTk6BkZx/LsUNDzmgMnZIMshVnwRGdRd+fy08Pd0VheO9aJXbEOyd0FKMcL+146yEgaUVoquAFGGmUQW3PhevqGSR3F+ZMm1juvlqXoTXvfjPcPuTIDn2xaQxmYNouk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neYf11cp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4HNAWKS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN36mSI1889412
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=neYf11cpzXgmFemA
	i14grOLM9x9385mdH+Uh9QeT+MPfvyVfWpTuR+OhOefbLFoWd2Ccp2B3D3rQ6Sc/
	xMeEZE2k6ST0z38HZ8ODBIRROdM1dDtDH2ToaCMZFo7nJyCKfVqNaecIxiljVeVB
	fBEVb9TvjRrvD8Gj6RR7MtVIv0oQDUqsr2HNpiQFzL36Sg69HRt4qlumtNEXP+hI
	5J55+A1r4PqXc/XgTzc8QJ1PfI9XE76eKBGbwg5j4I42Ugp6a0TfgNUxf9ng9wU/
	Q/gsoLVSdDuJ387PbmOBIZfFuPiAepkAgadBDqhWMtE42A8yYi+keMNlCKjpEhOs
	NwK5/g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak537-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a3a4af701so118506186d6.1
        for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484313; x=1767089113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=H4HNAWKSE+PGIq/GIVlAiroK/7lg6v6YpMyLKxzqLIlqPq4Wv0P/7dnC+ai854eD+E
         mB4XAd4IrQosUq1Z3zSUSgvSUxS9LjCaJSJ6stztPf7dCcjhpOlWkkPSUmhnuJsPMJkd
         pFy23ECrff6o9U5uqeQK4wSE8ISujxGJUuHw8ObXsE4xLS8dfjmhSLVM4kKRMpS/MPcS
         R+Styljsz7ynFuWn/5Jr8CPcf1Mu0xIwqpTxPG3CKEfeFLFi/pXI22mDJuRS2kiI4tTf
         F+2w4iqLOnn438gYW9xE20LCecz4jZ4+09SaSNhCnJJMahOxFsfOmdFKMuzKZpvHj/4A
         zIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484313; x=1767089113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=vOjDnm8zpkuXHaw8L70jEddRiqipJNIBMvc8/E0/sfaCArEzyoG0onJLqcoc8Wyr20
         3KsBJeKbnyQyQ0RKqTUgi/hickrByMDHYrpQQ8zwK20P/uo9FPNPqg9AaF14Der8WT7c
         W1HMKTkrewUr/3YDm51IfKyerSEWm1v4GaoMmFVgSMOfFyCSxOjuLDZmaSKeIroZjsVd
         aTPNnfJvHDSmTQCtDEruUwGIk4KwvEqCAzY1S2bwL2tPqUdqJg4D6aP0y7VER3fStsCk
         ASA/nNgp5bSwsTxpWLg8euKSF/3cEIZeA5TQVFuruGRjFsTdV3CYBvZ57VPO1V/eG1ru
         YFsg==
X-Forwarded-Encrypted: i=1; AJvYcCWWrPZGwmgZsVUPLALkikxw1nZ5z+/vWLBz2Rr4bKb4ZVwP9MjyrPFHagFSwdOS7zKCfCkj6JdrCZjF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhw3QzMZ06vZ5LFjrrOA9qQKl+nC8eZrrZ/9KxNjHOy74Njtqy
	bvbpsNdqlTCk+Xtc4My5Bk/OBJwcYAm4aZoDF8P5wcqF/DP0zt517Ens1gFj7lvecNl3h96ikvg
	HNbuHlRZMJmxPZVi4hXG/+UPO/IhT0K7WAUUGWv5JUQW00RnOyPAYmazOZQi6B+Wr
X-Gm-Gg: AY/fxX489+ubZw6uGoIOH2MG2QQSB7T+PZx+MIMsBfDDJYpoJLjC/nh4x8ai6N7LLkI
	V0pmZdvBRRVqI+xRd2DDs4budIzrR58ZlPCWyFkjkMDy87R10q9RuH/pDYqbOnZAyW7Lo1/dfq2
	TqdZ2EptsHgdNIaFkXliTTTi45ItmWrmRD/Ewovp51HeNhnvUWvkmTCETOrykY6vf2z4nDK1oag
	4t7Rx4mcZ6JeFxcWcpBaZiKUH6PSPmYKUwm5e6qxXnm88dditrrHoDT+myb62miYTXIa4oCleLO
	xHjAzSiAeBhedzMmf1icXk9Fy7zOSPmo3UXVwJziAi+Ld9eOQxt+s3JWsAdq0/J6QjnWf3KTlZe
	XaywRPHUWVtwFhCAiMzDIlTWjDK9xUOzDDQ0/6Sc=
X-Received: by 2002:a05:622a:2b43:b0:4ee:14c3:4e65 with SMTP id d75a77b69052e-4f4abd0dc28mr219101091cf.29.1766484313504;
        Tue, 23 Dec 2025 02:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEV+mwTcQ3wuFKlGzRImOSBX3IU5W98ElI3KLK7HMccseahW4yo+ZXWeG07JWxNXrTGTWcIBw==
X-Received: by 2002:a05:622a:2b43:b0:4ee:14c3:4e65 with SMTP id d75a77b69052e-4f4abd0dc28mr219100631cf.29.1766484313078;
        Tue, 23 Dec 2025 02:05:13 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:46 +0100
Subject: [PATCH 08/12] i2c: mxs: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-8-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlDjj4ADx2Rb3xlfAMnQkHbo+sz4ovgjz28L
 EWnVXIoR26JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQwAKCRAFnS7L/zaE
 w7tMD/97LcD5KIQOMf+6WEJ+Lz4Y1Sw14f+up28X7B/gK/6aOiM843NZ/hmzVa9bU64MhKZOtBj
 Cj79x6oDhbT1wV5CJqYQfcYVaggsb9jL7HAJeRIwncgaat/UWFl89z7CgFlrkF8v61h8TIaHNHX
 GUOX1GeUxGIYLIUhSbr0QRtiV6I8Y5G7NJDpEaKMez/2WGcT7J3dNyrvJex27vt3odTYWAmh1Re
 bUw7Szu+9wntv0yye4mU5MvTAagH8Pylg8fuqmausU57fvsxHKxY7ek7SJp639qLc4V7va+dRTD
 92Im5KhbVTPWmFi+//r8mEVUUP3aw6uhqzNvYjQNmBbN6O2NsQ1vhRv0UscP5PFPpUozR8Fwr0A
 GG3km2mDfVX+8hHy5Z/wncWcHzIgzSIgQMl/3/kvDZHfUbj7WsjgORc9MBuA0tVLmquG3SsMKI1
 MBTSirX1b0D1OnJgWIwT7BczgYl1iGQex/916YxS79M44kbMtaUPiEs/owXZpbkaeRl8UR7x2vt
 kGAtUZZM/8umqo40ZDE7R/Htuoxp+ZnmnOnad7LAQni7+SPyaQtQekWYayRzl6qTl2bJ10NLg1h
 uxTPPwxTWHIo6DnUtqr0m1Pyc6annr8KyI3AFwgncoMmA+c2ebY8I2rh5rWMU6Yfrftzojk2Gxv
 8yvkPnkIMS093Rw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX6H/sWE6Kc0T9
 LhUxkuIzRLIaUd0DnHGoPGbf7CqN0LAhVm5CaszZGyl1ORRKMmOFyavux5BK3fqnjG56Ds0LqkO
 WqZ45F5H/HJZFa9SGohzZs+l1JTt6H4CceqU8Epmo0heLP3q7jcSC+MhmvPLvsEgGjDPkcio426
 9EczcOqt8TsZb8WORQfnGyihAW6L51kmHaf/ufXvXxfTyMQOTnjUM9GKl+Lk7A8FxRqVPkVPBQS
 srTE4Ki+gAMgX0TRmks5RMeNwKlF1xZ3nAlFNugLm/8VytrlXZRwixiRHCFryGcmrfyq97xZ/K0
 xIiKkuD9Xl9L+mE4++Za+GkG+c7pP+dhPdVkvACXUqy/9UZI02vn7X6OvqZPRRU3nt2K8xZM5gN
 hcdUm7QhPo12nUBp7MdtR7oYlaf2d6qkZ9wYsmUZQJZFFaxnLg70DcuIVbvuGi7dyAZfd2bGG5s
 9khBnMTU9lUAykU/cIA==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a695a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZBRMoY1RY0NPWYz5CrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: B29JsuNmPb7txOHIg1kChNhhLCy8SmOU
X-Proofpoint-ORIG-GUID: B29JsuNmPb7txOHIg1kChNhhLCy8SmOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35151bac8d4adb80abdbd29a62b95a..bfbd96ee2f483cd1dd872c3448eaa6a17940d70f 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,9 +849,9 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &mxs_i2c_algo;
 	adap->quirks = &mxs_i2c_quirks;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	adap->nr = pdev->id;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->of_node = pdev->dev.of_node;
 	i2c_set_adapdata(adap, i2c);
 	err = i2c_add_numbered_adapter(adap);
 	if (err) {

-- 
2.47.3


