Return-Path: <linux-omap+bounces-5252-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0B5CD8BFD
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 11:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6640301F7C4
	for <lists+linux-omap@lfdr.de>; Tue, 23 Dec 2025 10:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B844B34FF4B;
	Tue, 23 Dec 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAS4G2Q7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MycQdT+6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E934D4F9
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484314; cv=none; b=HBlGZ2AFi6HYEIXk0gwEdT/LhvPc2bJxuYirXuA03I4WppYVlvIUK1Yoz7sMJl33ArWkGkXPKrKZYcDmqsVjVu0sTqBC9jOCmM0ZVrv+PNYCUajKT/VBkEAdVVNTa5XFaYGi0i5QCh0CDrelr9oR+gukJfXGRxpUa6o15C6v0Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484314; c=relaxed/simple;
	bh=4VTHCgrPHZIkSmUOibk7Y1K7i7wyCTns8fIiAuDUmjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTViKEEsId1bhlEw2p4D4GXMy5Ni1YfZ3z9+m/A5wOYszsr2gSLjQoTdYy4dJg23JDKHH9J8fTG5gLYVwLfnJKueL4XNYVkf3oL2+1KD1t6Ca+xsZ2XnfvAeiJspIL4/cGPajroycK1W7C/Ia0X2YThhNtsfHoVb8dK6HzsK70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAS4G2Q7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MycQdT+6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7abNC4044651
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=; b=QAS4G2Q7io445Ezh
	nAZ9Psw1yyqhWxNa/qHtPQXie7kitVAgyT+CqzSeeZd0iOkz1aOxuiT8VbTsFBHI
	CQUPFX5anQIUR9+ZSGpxbhRBiKCgBsM9fOBLFCJiBdJ6u3vMjSHCPlpJuqnTu9Y0
	8F+M7oUx/otBmTR14/BeueEo1srl2syW+BYtooSexJ7gYvdKlZ8ZEYMOJjsvk4w/
	t4+lvmcV6zcYiH4hvBANGvjrNxCmzEV+Mo/MQYQFwxetHvOZBkNbDd9hcRYsH8SE
	0p5xIzc1vueS+ubQwjsLfGbCQTsKjbnfc3CsWqGTQlWtWXDI0NUHhfa5a7HOrm+2
	LMWJQA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha6t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 10:05:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0193a239so50440361cf.0
        for <linux-omap@vger.kernel.org>; Tue, 23 Dec 2025 02:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484311; x=1767089111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=;
        b=MycQdT+6ni3GuqlLgSpTQIB2wv1KkM7IDFoxxxpwgCAI2DgwU2X05cuMyKFmGvX57w
         LOixs/CIjwX6mK8VVH29py5JRTya0JUnJZc7PJo5Lc35Cdcxqd9cw+LG5Teb3RpuqlED
         Mh3p3QP4U9SQb/y0AJz04ALvaBje4y1nxzmJveVFKAq2BkHWZ/LTyUGN/ofwDAD2+Jac
         L9qyi7HLPCsBJDUztSVYwZT3WOu15gOIUVsuZvVHVruRoTa0msLz5ZJV9JzGrvBeRcvk
         7PD1kzUhCoLYCn7byycsH6HBf5a/ohf/1OPX1oHtnIZqtSPyoIvPUcDLF5E7e/1vMlnF
         fDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484311; x=1767089111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=;
        b=neoTXcal4vsjNZVuBtAsjXosYYoN7XwhdFQdYZKJ8x5R8U1oyDevEWiGwG2Yb1ytHE
         R5VX/7YyZzXVx6SCZKcPgETRhOBsJGJYsgZXkVIA54zfqFZj0K8MJ0+gYE9/0GLQajk0
         Ml/LRMOsZOMseNC4nefJZtsRtLIPJyxBG8PaiBjpT6bnLTfsHsii5D5iZUwWB3TwJNC6
         yqr6siHuT1oYwsjF4wopcsDWexoAcesPsqSznU0ZsxvJlSUIgcau0xz97y8mchVHZ4iH
         3S8nk9Gu6NXV9MgcZTC56eXuwXD9MEr5fMUtO/sk3I09mV7k60UZeLj+1HhPB7OEbGa8
         hulw==
X-Forwarded-Encrypted: i=1; AJvYcCXs8hPks4Db69RZVBfRt72jgkaZZvjKPICreidq42nPtlURXEOA3d00YYOsZ3w8KMvgsBfunAAzmv+B@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMdMnWXuPLVO3lJh4o3Hn/inX4Otlb7Eg0OYYKL2Rouhfa9/D
	CSWnUUpoUkiYR9J9+ouX/9bFsEW/eAsjKICjB+yxUtgaSssZ0kOuBzFsfAL8TbCRYl06vjiy7ci
	c7NxsIWDkG7YPTUg7/FjBrgUOQMpVwbbbCGBnYhECnPDMvAEUsbqxbKEnFp/4V+VV
X-Gm-Gg: AY/fxX6yTvCKzDX+yv7zPpFFxDDabmwZYlDpr8+wS/Amz/bMcq1fB8P5QFTfiixwkEd
	aUUJ1dauyyGMqGTu9Ap4wNCfC7m/K528MhuUua1DUbFiKdrU3EXKUb98/uqu04f6VYf46XcPaMx
	fRS70vO/yK20AsTjTzduBYySETHXfIrfp9wmXpUxipIN738mxG+gu+GpU50AU5kP4AWRnfP50p+
	TmTnaJuVkqrMfJkgubdxL1qiLQnUAS1RVrvQLpmAa7fyKgfdhNuRl7KYglCx+mkRW+ObV5AU+5b
	/2gGYkQbGcg4zleFGgVy3xd7fwIDJH5dI6TZygsTpN8fEBRMI2vD/DX2+RjQip1zvpdd6QQ45N+
	jrXZ6c3+2zFYSXq74hnC1hEqAJs61R5TU/iKcMt0=
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221784271cf.1.1766484311413;
        Tue, 23 Dec 2025 02:05:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Q9GcA/8ICDBh3b32h+BDN0dPrIAIb45m474a1bZscaPBYkROzgBv0H89r6pe1f5PLFubmA==
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221783931cf.1.1766484310894;
        Tue, 23 Dec 2025 02:05:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:45 +0100
Subject: [PATCH 07/12] i2c: st: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-7-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4VTHCgrPHZIkSmUOibk7Y1K7i7wyCTns8fIiAuDUmjA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlCfBDo9ayd5xJjNDefHMY+MeprfqWaGSes7
 X/ntmYV6uWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQgAKCRAFnS7L/zaE
 wyySD/91tRc6qmcix1iUN41NkqvYaKWNZg7twzSemJ9R2CAbmtrAUoDnzD1pUdkhNQsAGQjwWFH
 7KmtVJYSWxgYWGsbmV/SCfiIUJRRjJoE0n7r3qa3R4HQBgZxAs3MPaVfs9aRMv4Bl26cnJe7Hh5
 BntwjvHXdv9BwUYUD76Fg4QDnT8OSycLzHHH9IHBSM2x5UUQpfTSy/yEvhUkU/SrdLisOk05l1j
 pyAuS4c10z/zMyo/Auo3Q2ovGAIXnSKI6YNh3helH7rDqCxVzTw/UX7j50/g//wpUcBu0gc606c
 LVaZgCpeTQQhRFD+i/haihsQWmCrIODQ3ashDc9sGKyKPWD49M6AsEEtsuasqO1Rx0SVKM1WwEz
 WYHanibvULvtfiGMUIQLziMHX0YFWvBAJlzcb4xpNuKHgAepDUzpimIicEhTJ9/EdFG3EDrpj3m
 MZ4jeedoXkvHYeM47k0xKoblIU9VoT9bdaENYwTDEfm+2tQz91bdN1HtmzAHTIjLmt/NaoBCyVH
 s0XXPQiJIewHbvOSWHPsc3EzJdUeTsDyPVQvzuAzADKipCiTgUxT2k7Mxzq7PNgIIQYwKXukpDG
 Ji7S4tEPwKd82IgVyMgNEg6g4ekYQlegH+ITIJxMIrqOfBl3UV7CpFZQL1AHCGCKQO1TOR08/eC
 q7hOFISKYAicpzg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: t1YK_vOFgxd2hwIu7ecdsuVMtyxOkfFw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXyToF/aBrz3zl
 48wAMF0ruj97z9TDaVVCTgi//jQMGab4JdsFTVZim+UmBeP/kQr338CQeIJJU67+0dSRVvcHGFE
 Pxh1AiYnWRJG90ZPKezPhDpT/KbctIsV2BYvoh8HerhfpTqAUi+RQLsyCY/wrUmK3EJAVFvvKiD
 gaNTmPql6w4bBnhbKXVX5JaNaZL2Bi777Ch/oSj96DKSrXkyVDeNbddK1T5TNeUMRpSIXrpYmP0
 FDX5OORDOFzitKRlP+ygkni6knL9kZJpOv8ntELLQ4OdHhV0ZEOq+Az+LUgrAVGqqYoZJh7NK17
 w/w8ci/0aWuJgBORoJ+mJEzGVyCc4MDJa9eMcYQU23KHweggFN+v+ogX38r5ot44Se+wERvEHum
 P0ISER6sdAZKSfkLWTYmVUZJwDZ3WWjQjc5tzizZfs8XHyILPXCNOojyRpMKxSrIEyNVmIiEUkS
 BxSE3NO2iMFFnqzRw9g==
X-Proofpoint-GUID: t1YK_vOFgxd2hwIu7ecdsuVMtyxOkfFw
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a6958 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5jvZOilLG3lo3iFWl1UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 97d70e66722706f242cd97153387c3a865abc12d..b50be2c39eaa4b9b95a71b038a4d63f3c5fd7c4b 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -849,8 +849,8 @@ static int st_i2c_probe(struct platform_device *pdev)
 	adap->retries = 0;
 	adap->algo = &st_i2c_algo;
 	adap->bus_recovery_info = &st_i2c_recovery_info;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	init_completion(&i2c_dev->complete);
 

-- 
2.47.3


