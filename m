Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEC5160F90
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 11:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729118AbgBQKHn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 05:07:43 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:25883 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729073AbgBQKHm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 05:07:42 -0500
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20200217100739epoutp04c2b80e03b6e80fb761c580ff77cf0ff8~0KKVC97ts2948329483epoutp04I
        for <linux-omap@vger.kernel.org>; Mon, 17 Feb 2020 10:07:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20200217100739epoutp04c2b80e03b6e80fb761c580ff77cf0ff8~0KKVC97ts2948329483epoutp04I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1581934059;
        bh=zXnDl0nu3nzOsArCKYWW31gJGbSZ8lFSvU3DpzQ8ljI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=VlmioPnHHeQvcm0bn2qg7fZEVHhyoTZBsYRh74qJU6L23zHrGL5eYnmtkCpZm5R1I
         YrOMGH/c3P54hWxmoBFb/ruObLNpQy3enDyxmGZMaocpbH8T2XgHoznDmq0xO17pIq
         qOZ8jSB0v+rYyl9kM14/Pv3Cs0WIxS5tcn59b9LU=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200217100738epcas1p18bec8aa260f9c99c4ccbca6fe4efe876~0KKUR_kTM2400024000epcas1p1W;
        Mon, 17 Feb 2020 10:07:38 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.152]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 48Lfml5SZNzMqYkZ; Mon, 17 Feb
        2020 10:07:35 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        57.4C.57028.7E56A4E5; Mon, 17 Feb 2020 19:07:35 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200217100735epcas1p2d3f17024084cc5bd6d131cf270cecd4e~0KKQ-7kDj1780717807epcas1p2K;
        Mon, 17 Feb 2020 10:07:35 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200217100735epsmtrp1d666fd81aed6c627ad17e736e24f85bc~0KKQ-R5TX2988229882epsmtrp1V;
        Mon, 17 Feb 2020 10:07:35 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-02-5e4a65e7b559
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        69.94.06569.6E56A4E5; Mon, 17 Feb 2020 19:07:34 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200217100734epsmtip2c7a38ee4f8e4680a3c11645784faa226~0KKQ20JsQ2348823488epsmtip2n;
        Mon, 17 Feb 2020 10:07:34 +0000 (GMT)
Subject: Re: [PATCH] extcon: palmas: hide error messages if gpio returns
 -EPROBE_DEFER
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <b9fe52e9-0340-4204-ee85-44b6c1ea7f3b@samsung.com>
Date:   Mon, 17 Feb 2020 19:15:42 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
        Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <f65ad0ef2866e7d5b6743e13579c1efe8c572b4f.1581929741.git.hns@goldelico.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDJsWRmVeSWpSXmKPExsWy7bCmnu7zVK84g/kHNS1+bPvKZHHpa43F
        1j+X2Cwu75rDZjF7ST+Lxe3GFWwObB5r3p9i9miZtIvd40tLM7NH35ZVjB6fN8kFsEZl22Sk
        JqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYAHaCkUJaYUwoU
        CkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM7oePqW
        peAVT8XU9oIGxh1cXYycHBICJhLfN15hAbGFBHYwSiyZ4d3FyAVkf2KUOPJyHRNE4hujRNcB
        T5iGjn2n2SCK9jJK9M26zwzhvAfqWN/IDlIlLBAh0Xn3ClCCg0NEIFLi6BcjkDCzQJnE12ub
        mEFsNgEtif0vbrCB2PwCihJXfzxmBLF5Bewkps1+xgpiswioSjxasAysXlQgTOLkthaoGkGJ
        kzOfgF3NCbTqw5EuRoj54hK3nsxngrDlJba/nQN2m4TAYzaJW6+PsUF84CIx4+5DRghbWOLV
        8S3sELaUxMv+Nii7WmLlySNsEM0djBJb9l9ghUgYS+xfOpkJ5DFmAU2J9bv0IcKKEjt/z4U6
        gk/i3dceVpASCQFeiY42IYgSZYnLD+4yQdiSEovbO9kmMCrNQvLOLCQvzELywiyEZQsYWVYx
        iqUWFOempxYbFhgiR/UmRnDK1DLdwTjlnM8hRgEORiUe3heBnnFCrIllxZW5hxglOJiVRHi9
        xb3ihHhTEiurUovy44tKc1KLDzGaAkN7IrOUaHI+MJ3nlcQbmhoZGxtbmBiamRoaKonzPozU
        jBMSSE8sSc1OTS1ILYLpY+LglGpgTCtolXv44fXNAw7Zs9yWz/e+pGD73FZzft5TtUcpJ9k6
        bcObrlx4EvHcu+/iSYEZC/NM6m7mnPvfdpyFQyRGcu6dlZNXWkWU879vvCjkurPSMu131f5P
        23xmfPGT0fg2NZ7LeJIkg/DdiVLSKs11D3TMm05arFDbr9i++ZqT2JYMnc3Hb/NJKLEUZyQa
        ajEXFScCAGzGtyuvAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeLIzCtJLcpLzFFi42LZdlhJXvdZqlecwZwtNhY/tn1lsrj0tcZi
        659LbBaXd81hs5i9pJ/F4nbjCjYHNo81708xe7RM2sXu8aWlmdmjb8sqRo/Pm+QCWKO4bFJS
        czLLUov07RK4MjqevmUpeMVTMbW9oIFxB1cXIyeHhICJRMe+02xdjFwcQgK7GSX6G5qYIRKS
        EtMuHgWyOYBsYYnDh4shat4ySsyaf5IdpEZYIEKi8+4VsHoRgUiJSwtfgsWZBcokznWcZ4Ro
        WM0ocWLHKkaQBJuAlsT+FzfYQGx+AUWJqz8eg8V5Bewkps1+xgpiswioSjxasAxsqKhAmMTO
        JY+ZIGoEJU7OfMICYnMCLf5wpIsRYpm6xJ95l5ghbHGJW0/mM0HY8hLb385hnsAoPAtJ+ywk
        LbOQtMxC0rKAkWUVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZwBGlp7WA8cSL+EKMA
        B6MSD69DiGecEGtiWXFl7iFGCQ5mJRFeb3GvOCHelMTKqtSi/Pii0pzU4kOM0hwsSuK88vnH
        IoUE0hNLUrNTUwtSi2CyTBycUg2MUiHFzLU7TfVs9qasDDtwwG9HZKLXQse57rIsAkb8K1gr
        RQ+2qyQc2FolsWR3uOUxPt13s+okJr2cuktRco+jcWTFR67/bFLhu5u3eTK+knc2dFH1vnH5
        5zEvRcXzp96We4U5CHvIHfhgwvtr9i230xv8L+Yv2xPxpv4gg+B0q6crBdJbZYqUWIozEg21
        mIuKEwGejteJnAIAAA==
X-CMS-MailID: 20200217100735epcas1p2d3f17024084cc5bd6d131cf270cecd4e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200217085551epcas1p49113220d034155f8a78dc5e0767637a5
References: <CGME20200217085551epcas1p49113220d034155f8a78dc5e0767637a5@epcas1p4.samsung.com>
        <f65ad0ef2866e7d5b6743e13579c1efe8c572b4f.1581929741.git.hns@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On 2/17/20 5:55 PM, H. Nikolaus Schaller wrote:
> If the gpios are probed after this driver (e.g. if they
> come from an i2c expander) there is no need to print an
> error message.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/extcon/extcon-palmas.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
> index edc5016f46f1..9c6254c0531c 100644
> --- a/drivers/extcon/extcon-palmas.c
> +++ b/drivers/extcon/extcon-palmas.c
> @@ -206,14 +206,16 @@ static int palmas_usb_probe(struct platform_device *pdev)
>  	palmas_usb->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id",
>  							GPIOD_IN);
>  	if (IS_ERR(palmas_usb->id_gpiod)) {
> -		dev_err(&pdev->dev, "failed to get id gpio\n");
> +		if (PTR_ERR(palmas_usb->id_gpiod) != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get id gpio\n");
>  		return PTR_ERR(palmas_usb->id_gpiod);
>  	}
>  
>  	palmas_usb->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus",
>  							GPIOD_IN);
>  	if (IS_ERR(palmas_usb->vbus_gpiod)) {
> -		dev_err(&pdev->dev, "failed to get vbus gpio\n");
> +		if (PTR_ERR(palmas_usb->vbus_gpiod) != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get vbus gpio\n");
>  		return PTR_ERR(palmas_usb->vbus_gpiod);
>  	}
>  
> 

Usually, gpio driver like pinctrl is very early probed
because almost device drivers should use gpio.
So, I have not any experience about this situation.
Do you meet this situation on any h/w board?

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
