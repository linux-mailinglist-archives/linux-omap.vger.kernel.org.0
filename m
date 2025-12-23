Return-Path: <linux-omap+bounces-5251-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C9228CD90F1
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 12:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 706B03014D46
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 11:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928A734F46D;
	Tue, 23 Dec 2025 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8Tfbjr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TizzNoso"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7729E34B1A5
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484313; cv=none; b=iVv08gRGcZm/G6tvZW9br3eo7ObUOABySifRKsIfQZKHGFGkVjUEZeGj+gZobkVq++D1hRroWYg3Q67YZZZlZT7I8U3lFTrp9HV3jhcwz1nKGvfcLnS+C8lAT88UTQ/FGmQufPdNE9mGKSuBUzaGiI0RmEhDxes0jIreZ9OWYac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484313; c=relaxed/simple;
	bh=/F0evc1zIjFfr2ewDDdTKZJybhly+0fCX6IEry5KDtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZ59tltED+NMOYTjgDb2vI2iIyor/D7h1mW3oCMC3DvfAll59WknwilLgp5fuSuIm6AgSilme8Yh/0ADYGSQE609rz6AnXJ+GB8DTjXkWV4ZnyxK8pVXPB/+f36TN/yF75l4z11XMX4WVzRVjrSGy4lBcaIg0WWUQPxsT8YU4Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8Tfbjr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TizzNoso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5WQ3m1903861
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=; b=l8Tfbjr+W7psjUUU
	7h9yFHu7TmiM0takP87iaaE4CwcQ0s/SSGiTZhIhaaprOvWzM20VYMwRdXYiGF4+
	xBuP/Fn5TtlOpvbhyoLsLgWPnTRINvQ/uJRhXouFgr0EYaOp42WaceQ2q6r3iBtw
	fV15a+xCoFwQzKYwGZKC0hdGBEs8lp8ArmeJozlhIJDpjAHT5jbX3OW9FCgtKck4
	cF15vzcv8Mu9KdQuUzp/hiePRG7yGi1LoJvlsv6/s42UEQTCofB/yejb/1O1XLK5
	gRHW0L7K/+t61bX3KMGaq7CWYxNng00dx9uinSHuISWMjAEwSAHL3rcosBLWt0IG
	HpJN1Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed69f9ce96so157567421cf.3
        for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484310; x=1767089110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=;
        b=TizzNosoj2Wr/rZw6Vqy/Lb2yZzUoGljXqBwTd7vKfVIEVIuUaGw8If1vIRISzpVFc
         2T0kQsGxWh34X4UfW7Vxm2RlgINjAZtx3sZ7xwMtt03mdDYnPK7L1t8BuNHDxG+CYKTc
         QkZ/cyBcKmqDOXBmLRqCnPsdiDCWHHVs/BLJ8Tv5h1HDQbOKL06pPPazlpVsoMNoX9cQ
         B4c4Z2DgGjYPMBCs6IXQnPMo9yXZaq3XqxFUCchtiezkCizmVvx0b0d1BBVU6E3pHyLk
         UtLil6MrCfc/9q+aqFyuV+1swafOZVJjPSc6DhfCHZvg0ngBcENY79f4D0mxvRgYvZmr
         W9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484310; x=1767089110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=;
        b=NuJKY0wKX99Wv6i/SGlUf0S8uSMFoxzfhnB9zfkXr0tVupmgmxMYtscwF6i+8ZxZys
         ogqv1H/Jo4m9bKeBu62KdIzevSRCs+INj7gwVCchmxcTPP3taRY/1VSSExoSTstipnxK
         VeZf0wTjo5T78SZBo/ZkooT3iJzq+ueJnE+10n5hzQuMmMTEOgpIPzWRiA1mOR5ZgWH1
         4wgBz6sOHYlktlnuJXjfL+1ai9bTSFO3yDgXYe0ItmzfEYcHxkd7XwIaiq9YHclDuc5h
         bt5ZgFtoeL6c+u/AW4SRPgtZM/zwgJQW7D8qG4hp+TcSXdiwGKOkPNZcS4Yacg3WqbcC
         O1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXxLLYU2O6phNuz2DNJ2mLxg2rAEoH/x/VbvR++q39mN5l3jXNus4XfQPZjR58j6ryN/o4+63ztPEc4@vger.kernel.org
X-Gm-Message-State: AOJu0YwbZ9r2hMdCs8akJ2qr1bAI3FzWTyaPZdiqjvOK+scCnnjKPVjb
	7o1F/O0U+zpxavBYlEFPTBaNexhb0zN0DU3mzV8ZW6k4FXLnvBBQP2coRN+gm6CHXeLImjXT2tK
	2gQqMEoZa/w9saGtkO+ofGcCvJyl8prC9i7bqO8wXl9x2I4/M4sZ1A1vW5mKWNIuA
X-Gm-Gg: AY/fxX4Z5+jQI42i/yvjgP+i7r+gn+5PqJ1KRlnfC13jJWOJI3JClnMKNqDChio6bkQ
	A4EBKcnh8dh94vLay2KGRCA6gbsE976fWt2BzUiTD0oO+34E1PIqZidWbxALRwdyP4k/TY0myKV
	tv6j8CWdLcQkCQbabJ1tHF6ikikw7U/cjvQ1SvevLsVvscEuNM00+AVmDviQqH/C3hvDGZ/AMAA
	sF7bIf3L2XZ3NAtX1z3HWcp2yNXxS3p70GDf2DZVO5PdWnk92x8YD8jDJIDkTptCj885P7afSKf
	IxHZPYJgQ+J0RKQuuGPHXWXfSMUw3pvtssRvp6tuTlR1K31NHx2Wfov4n/67EtPy9qRDgvdOG6I
	VMmim8cuMDR0WVgEzLPEdVS1VPpsCgOakGj0AYZQ=
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id d75a77b69052e-4f4abcef65bmr213879421cf.27.1766484309794;
        Tue, 23 Dec 2025 02:05:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUDMHH9B67S701dxFG87AKQUqiqvJUUAv/hUAmqhTfe5BbC71sFiGcdmPZCv/zu5rHbZ2Mhg==
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id d75a77b69052e-4f4abcef65bmr213879131cf.27.1766484309345;
        Tue, 23 Dec 2025 02:05:09 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:44 +0100
Subject: [PATCH 06/12] i2c: rcar: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/F0evc1zIjFfr2ewDDdTKZJybhly+0fCX6IEry5KDtc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlB3xveTvcVkYCQoJDpJL6WY2ws5IAOmbPUh
 KbMW9O6TNKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQQAKCRAFnS7L/zaE
 wxPKEAC7gN9dvo8EvWFoZuSf9r+OwOYHj8Kqi1P8Azur1g7NL+9EQQMBH2uh3jlmWx2zTGD0e4+
 lOxS4r2oHWPcRpWFry9Dk1v9YaK1P0vjXrqc5n5BjKCcYc9rKygPkteQqw3MygXHbRtNJefh1Qo
 2CLIi44w4onmzo0+7L37c2WjI7b2RwJaQWttAXetrYL/GEGAMrqugaTjEKu6snoZaYTLWG7VzFo
 HCx/rLWe5YrKJw8P7A7ug7P9z4WyIdYQaHcY8Lkxg9ZIDEJxzjoE98PTUIiQ7NqZz3e/ZUvQMVr
 4V/uCWv6hbzONzIUGJqNFePRcCrTseT/EOEQk+SRrnnihURotNCi8LSG1Kk7uvjZgqJFnwX71U5
 PharzUnoKUpBdkFT2z6f0ys8dMt+zEtmaS/DHqszxXKgVdnG+BSI2zvd6Es+/sskGGwOcgRVce3
 J/WVYPTzHgVhn0+rE1bSonNBS4YfmkZBNimrCB6oknQtEsMYP8xrNUM5CFgTeve/xDmhrXRJnSt
 mtek6CoVmzHtbrrfNc4XobOkIFUVBD7JDbFmPMkNBbMed93IN8gYEdPCSkcUJelQ/lepFlUJj3h
 SVv3gkGlra1bRI+/lIOzIN6LC/w6uwgC/PLMSW5fAxODqlytmoS6hYZYXxa+9Iibn2niXh8GhO/
 B4QbR0eAn2bIKPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX8dNpVv76sM8v
 KohWqMYkJe1vkT8JAwlQd/3baeJf8UWCbpGm6R1kOQmqWZBE0Ssd4El5iIF0EcDDB6uZtXc7qkc
 8vsS9zyhnp+lIQgBz2HlnDAj5SH3dTpL2lBZmzkhiSMJqm+oca1f6SgRde+/I4vQQ6NXYZ3+W0X
 LjnWDY1HtZctMmkvKWLzbLEZ6G51pUyF8qVwOtWAfNVpaELs1lDrT0FU/1gU1skNeh7Q/euqdTd
 unD7YpgsDCbdPuJWncfElpMll0cp17losQp7g+Y17pcve/49bLb9xIuGQHBB3/Gl4q7M9BfYAMW
 g16a/kUMtNHHju2BoVH8++ESpTFzRIZkQYkn538E/7Ox3G7DhKWj3FUnNwiqHQXgjYpj8/dyiiC
 hkuoTRIGuXgZJiF3nyHRRH3QLNQyNqTJ3xRplGrWN3ZTanqfAjTMfsldoHj5Zfi/B/2bhYLLHz9
 eYOSnCPZhW+hraMKnIA==
X-Proofpoint-GUID: jHNroFXaH-3PPog_VvKjUm6sGUccmjlH
X-Proofpoint-ORIG-GUID: jHNroFXaH-3PPog_VvKjUm6sGUccmjlH
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a6956 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=E7P0tHU5vGGU1I44B8QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5ce8f8e4856fb2bb21c9cd731ddbbd8f3622ca26..86826502533bf866ca81cb86ddd10b2a2be3c798 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	adap->algo = &rcar_i2c_algo;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->retries = 3;
-	adap->dev.parent = dev;
-	adap->dev.of_node = dev->of_node;
+	adap->parent = dev;
+	adap->of_node = dev->of_node;
 	adap->bus_recovery_info = &rcar_i2c_bri;
 	adap->quirks = &rcar_i2c_quirks;
 	i2c_set_adapdata(adap, priv);

-- 
2.47.3


